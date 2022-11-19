import 'package:bapways_integrated_system/components/common/render_empty_data.dart';
import 'package:bapways_integrated_system/components/common/render_error_desktop.dart';
import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:bapways_integrated_system/dataSources/cocoa_data_source.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../common/on_row_tap.dart';

class AllCocoaDataDesktop extends GetView<CocoaController> {
  const AllCocoaDataDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.doneEditing();
    return ScaffoldPage(
      header: const PageHeader(
        title: Text(
          'All Cocoa Distributions',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(child: ProgressRing());
          } else if (!controller.errorMap['isError'] &&
              controller.cocoaDistributionList.isEmpty) {
            return const RenderEmptyData();
          } else if (controller.errorMap['isError']) {
            return RenderErrorDesktop(
                errorText: 'Server cannot be reached',
                onPressed: () {
                  controller.getAllCocoaData();
                });
          } else {
            return SfDataGridTheme(
                data: SfDataGridThemeData(
                  frozenPaneElevation: 0.0,
                  frozenPaneLineColor: Colors.transparent,
                  frozenPaneLineWidth: 1.5,
                ),
                child: SfDataGrid(
                  source: CocoaDataSource(
                      cocoaDistributionData: controller.cocoaDistributionList),
                  onCellTap: (details) {
                    if (details.rowColumnIndex.rowIndex != 0) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return OnRowTap(
                                name: controller
                                    .cocoaDistributionList[
                                        details.rowColumnIndex.rowIndex - 1]
                                    .clientName,
                                otherDetail:
                                    'Farmer Id: ${controller.cocoaDistributionList[details.rowColumnIndex.rowIndex - 1].clientId}',
                                onEditPressed: () {
                                  controller.startEditing();
                                  controller.assignCocoaDataToEdit(
                                    controller
                                        .cocoaDistributionList[
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
                  columnWidthMode: ColumnWidthMode.fill,
                  columnWidthCalculationRange:
                      ColumnWidthCalculationRange.allRows,
                  onQueryRowHeight: (details) {
                    return details.rowIndex == 0 ? 50.0 : 40.0;
                  },
                  frozenColumnsCount: 1,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'farmer_id',
                        autoFitPadding: const EdgeInsets.all(10.0),
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'FARMER ID',
                              softWrap: false,
                            ))),
                    GridColumn(
                        columnName: 'client_name',
                        autoFitPadding: const EdgeInsets.all(10.0),
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'FARMER NAME',
                            ))),
                    GridColumn(
                        columnName: 'kg_to_company',
                        autoFitPadding: const EdgeInsets.all(10.0),
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'KG TO COMPANY',
                            ))),
                    GridColumn(
                        columnName: 'kg_to_client',
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'KG TO CLIENT',
                            ))),
                    GridColumn(
                        columnName: 'bags',
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'TOTAL BAGS',
                            ))),
                    GridColumn(
                        columnName: 'date_of_sale',
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'DATE OF SALE',
                            ))),
                  ],
                ));
          }
        }),
      ),
    );
  }
}
