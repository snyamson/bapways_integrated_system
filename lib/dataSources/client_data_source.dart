import 'package:bapways_integrated_system/schema/schema.dart';
import 'package:bapways_integrated_system/utils/generate_ids.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ClientDataSource extends DataGridSource {
  List<DataGridRow> _clientData = [];

  ClientDataSource({required List<Client> clientData}) {
    _clientData = clientData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(
                  columnName: 'id',
                  value: GenerateId.assignClientId(e.clientId)),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'phone', value: e.phone),
              DataGridCell<String>(columnName: 'gender', value: e.gender),
              DataGridCell<String>(columnName: 'location', value: e.location),
              DataGridCell<String>(columnName: 'district', value: e.district),
              DataGridCell<String>(
                  columnName: 'date_of_registration',
                  value: e.dateOfRegistration),
              DataGridCell<String>(columnName: 'crop_type', value: e.cropType),
              DataGridCell<String>(columnName: 'farm_size', value: e.farmSize),
              DataGridCell<String>(
                  columnName: 'registered_by', value: e.officer?.name),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => _clientData;

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
