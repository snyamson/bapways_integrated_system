import 'package:bapways_integrated_system/components/common/render_empty_data.dart';
import 'package:bapways_integrated_system/components/common/render_error_desktop.dart';
import 'package:bapways_integrated_system/controllers/client_controller.dart';
import 'package:bapways_integrated_system/dataSources/client_data_source.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/on_row_tap.dart';

class AllClientDesktop extends GetView<ClientController> {
  const AllClientDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.doneEditing();

    return ScaffoldPage(
      header: const PageHeader(
        title: Text(
          'All Clients',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(child: ProgressRing());
          } else if (!controller.errorMap['isError'] &&
              controller.clientsList.isEmpty) {
            return const RenderEmptyData();
          } else if (controller.errorMap['isError']) {
            return RenderErrorDesktop(
                errorText: '',
                onPressed: () {
                  //  controller.getClientsList();
                });
          } else {
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                frozenPaneElevation: 0.0,
                frozenPaneLineColor: Colors.transparent,
                frozenPaneLineWidth: 1.5,
              ),
              child: SfDataGrid(
                source: ClientDataSource(clientData: controller.clientsList),
                onCellTap: (details) {
                  if (details.rowColumnIndex.rowIndex != 0) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return OnRowTap(
                              name: controller
                                  .clientsList[
                                      details.rowColumnIndex.rowIndex - 1]
                                  .name,
                              otherDetail:
                                  'Phone Number: ${controller.clientsList[details.rowColumnIndex.rowIndex - 1].phone}',
                              onEditPressed: () {
                                controller.startEditing();
                                controller.assignClientDataToEdit(
                                  controller
                                      .clientsList[
                                          details.rowColumnIndex.rowIndex - 1]
                                      .id
                                      .toString(),
                                );
                                controller.onPageChange(1);
                                Navigator.pop(context);
                              });
                        });
                  }
                },
                allowPullToRefresh: true,
                allowSwiping: true,
                selectionMode: SelectionMode.single,
                navigationMode: GridNavigationMode.row,
                columnWidthMode: ColumnWidthMode.auto,
                columnWidthCalculationRange:
                    ColumnWidthCalculationRange.allRows,
                onQueryRowHeight: (details) {
                  return details.rowIndex == 0 ? 50.0 : 40.0;
                },
                frozenColumnsCount: 1,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'id',
                      autoFitPadding: const EdgeInsets.all(10.0),
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'ID',
                            softWrap: false,
                          ))),
                  GridColumn(
                      columnName: 'name',
                      autoFitPadding: const EdgeInsets.all(10.0),
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'NAME',
                          ))),
                  GridColumn(
                      columnName: 'phone',
                      autoFitPadding: const EdgeInsets.all(10.0),
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'PHONE',
                          ))),
                  GridColumn(
                      columnName: 'gender',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'GENDER',
                          ))),
                  GridColumn(
                      columnName: 'location',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'LOCATION',
                          ))),
                  GridColumn(
                      columnName: 'district',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'DISTRICT',
                          ))),
                  GridColumn(
                      columnName: 'dateOfEmployment',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'DOE',
                            softWrap: false,
                          ))),
                  GridColumn(
                      columnName: 'crop_type',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'CROP TYPE',
                          ))),
                  GridColumn(
                      columnName: 'farm_size',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'FARM SIZE',
                          ))),
                  GridColumn(
                      columnName: 'registered_by',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'OFFICER',
                          ))),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
