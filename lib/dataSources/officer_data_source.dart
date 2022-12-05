import 'package:bapways_integrated_system/schema/schema.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OfficerDataSource extends DataGridSource {
  List<DataGridRow> _officerData = [];

  String formatId(int id) {
    if (id < 10) {
      return 'BSA-G/00$id';
    } else {
      return 'BSA-G/0$id';
    }
  }

  OfficerDataSource({required List<Officer> officerData}) {
    _officerData = officerData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: e.officerId),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'phone', value: e.phone),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'gender', value: e.gender),
              DataGridCell<String>(columnName: 'location', value: e.location),
              DataGridCell<String>(
                  columnName: 'level of educ', value: e.levelOfEduc),
              DataGridCell<String>(
                  columnName: 'date of employment', value: e.dateOfEmployment),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _officerData;

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
