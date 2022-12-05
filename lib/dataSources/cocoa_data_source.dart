import 'package:bapways_integrated_system/models/cocoa_distribution.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CocoaDataSource extends DataGridSource {
  List<DataGridRow> _cocoaDistributionData = [];

  CocoaDataSource({required List<CocoaDistribution> cocoaDistributionData}) {
    _cocoaDistributionData = cocoaDistributionData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'farmer_id', value: e.clientId),
              DataGridCell<String>(
                  columnName: 'client_name', value: e.clientName),
              DataGridCell<int>(
                  columnName: 'kg_to_company', value: int.parse(e.kgToCompany)),
              DataGridCell<int>(
                  columnName: 'kg_to_client', value: int.parse(e.kgToClient)),
              DataGridCell<int>(
                columnName: 'total_kg',
                value: totalKg(e.kgToClient, e.kgToCompany),
              ),
              DataGridCell<double>(
                  columnName: 'bags',
                  value: bags(totalKg(e.kgToClient, e.kgToCompany))),
              DataGridCell<String>(
                  columnName: 'date_of_sale', value: e.dateOfSale),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _cocoaDistributionData;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        rowColumnIndex.columnIndex == 5
            ? double.parse(summaryValue).toStringAsFixed(4)
            : summaryValue,
        overflow: TextOverflow.visible,
      ),
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            e.value.toString(),
            overflow: TextOverflow.visible,
          ),
        );
      }).toList(),
    );
  }

  void updateDataGridSource() {
    notifyListeners();
  }

  int totalKg(String toClient, String toCompany) {
    int total = int.parse(toClient) + int.parse(toCompany);
    return total;
  }

  double bags(int totalKg) {
    return double.parse((totalKg / 64).toStringAsFixed(4));
  }
}
