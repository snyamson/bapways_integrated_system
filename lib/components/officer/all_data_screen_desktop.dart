import 'package:bapways_integrated_system/components/common/on_row_tap.dart';
import 'package:bapways_integrated_system/components/common/render_empty_data.dart';
import 'package:bapways_integrated_system/components/common/render_error_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../controllers/officer_controller.dart';
import '../../dataSources/officer_data_source.dart';

class AllDataScreenDesktop extends GetView<OfficerController> {
  const AllDataScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.doneEditing();
    // controller.fetchOfficers();

    return ScaffoldPage(
      header: const PageHeader(
        title: Text(
          'All Officers',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(child: ProgressRing());
          } else if (!controller.errorMap['isError'] &&
              controller.officersList.isEmpty) {
            return const RenderEmptyData();
          } else if (controller.errorMap['isError']) {
            return RenderErrorDesktop(
                errorText: 'Server Could Not Be Reached',
                onPressed: () {
                  //  controller.getOfficersList();
                });
          } else {
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                frozenPaneElevation: 0.0,
                frozenPaneLineColor: Colors.transparent,
                frozenPaneLineWidth: 1.5,
              ),
              child: SfDataGrid(
                source: OfficerDataSource(
                  officerData: controller.officersList,
                ),
                onCellTap: (details) {
                  if (details.rowColumnIndex.rowIndex != 0) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return OnRowTap(
                              name: controller
                                  .officersList[
                                      details.rowColumnIndex.rowIndex - 1]
                                  .name,
                              otherDetail:
                                  'Phone Number: ${controller.officersList[details.rowColumnIndex.rowIndex - 1].phone}',
                              onEditPressed: () {
                                controller.startEditing();
                                controller.assignOfficerDataToEdit(
                                  controller
                                      .officersList[
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
                      columnName: 'email',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'EMAIL',
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
                      columnName: 'levelOfEduc',
                      label: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'EDUCATION',
                            softWrap: false,
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
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
