import 'package:bapways_integrated_system/components/common/export_data_modal.dart';
import 'package:bapways_integrated_system/components/common/render_empty_data.dart';
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
      header: PageHeader(
        title: const Text(
          'All Cocoa Distributions',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
        commandBar: SizedBox(
          width: Get.width / 8,
          child: CommandBar(
            primaryItems: [
              CommandBarButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ExportDataModal(),
                  );
                },
                icon: const Icon(FluentIcons.database_source),
                label: const Text('Export Data'),
              ),
            ],
          ),
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
          } else {
            return SfDataGridTheme(
                data: SfDataGridThemeData(
                  frozenPaneElevation: 0.0,
                  frozenPaneLineColor: Colors.transparent,
                  frozenPaneLineWidth: 1.5,
                ),
                child: SfDataGrid(
                  key: controller.cocoaDataKey,
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
                              },
                              onDeletePressed: () {
                                controller.deleteCocoaData(
                                  controller.cocoaDistributionList[
                                      details.rowColumnIndex.rowIndex - 1],
                                );
                                Navigator.pop(context);
                              },
                            );
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
                  frozenColumnsCount: 1,
                  tableSummaryRows: [
                    GridTableSummaryRow(
                      showSummaryInRow: false,
                      color: Colors.grey.withOpacity(0.04),
                      columns: [
                        const GridSummaryColumn(
                          name: 'farmer_id',
                          columnName: 'farmer_id',
                          summaryType: GridSummaryType.count,
                        ),
                        const GridSummaryColumn(
                          name: 'kg_to_company',
                          columnName: 'kg_to_company',
                          summaryType: GridSummaryType.sum,
                        ),
                        const GridSummaryColumn(
                          name: 'kg_to_client',
                          columnName: 'kg_to_client',
                          summaryType: GridSummaryType.sum,
                        ),
                        const GridSummaryColumn(
                          name: 'total_kg',
                          columnName: 'total_kg',
                          summaryType: GridSummaryType.sum,
                        ),
                        const GridSummaryColumn(
                          name: 'bags',
                          columnName: 'bags',
                          summaryType: GridSummaryType.sum,
                        )
                      ],
                      position: GridTableSummaryRowPosition.bottom,
                    )
                  ],
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
                        columnName: 'total_kg',
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'TOTAL KG',
                            ))),
                    GridColumn(
                        columnName: 'bags',
                        label: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'BAGS',
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
