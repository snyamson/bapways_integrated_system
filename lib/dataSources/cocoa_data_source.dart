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
              DataGridCell<String>(
                  columnName: 'kg_to_company', value: e.kgToCompany),
              DataGridCell<String>(
                  columnName: 'kg_to_client', value: e.kgToClient),
              DataGridCell<String>(columnName: 'bags', value: e.totalKg),
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
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}
