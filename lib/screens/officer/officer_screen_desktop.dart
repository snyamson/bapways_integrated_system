import 'package:bapways_integrated_system/components/officer/add_officer_desktop.dart';
import 'package:bapways_integrated_system/components/officer/generate_access.dart';
import 'package:bapways_integrated_system/controllers/auth_controller.dart';
import 'package:bapways_integrated_system/controllers/officer_controller.dart';
import 'package:bapways_integrated_system/components/officer/all_data_screen_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class OfficerScreenDesktop extends GetView<OfficerController> {
  OfficerScreenDesktop({Key? key}) : super(key: key);
  final AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Obx(
        () => TabView(
            currentIndex: controller.index.value,
            onChanged: (index) {
              controller.onPageChange(index);
            },
            tabs: const [
              Tab(
                text: Text('All Officers'),
                closeIcon: FluentIcons.tab,
                icon: Icon(FluentIcons.list),
              ),
              Tab(
                text: Text('Add Officer'),
                closeIcon: FluentIcons.tab,
                icon: Icon(FluentIcons.add),
              ),
              Tab(
                text: Text('Generate Access'),
                closeIcon: FluentIcons.tab,
                icon: Icon(FluentIcons.generate),
              ),
            ],
            bodies: const [
              AllDataScreenDesktop(),
              AddOfficerDesktop(),
              GenerateAccess(),
            ]),
      ),
    );
  }
}






// Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 250,
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     DesktopAppButton(
//                         label: 'New Entry',
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return const AddOfficer();
//                               });
//                         }),
//                     const SizedBox(height: 25),
//                   ],
//                 )),
//           ),
//           const Divider(direction: Axis.vertical),
//           Expanded(
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8),
//                 child: GetBuilder<OfficerController>(builder: (controller) {
//                   return SfDataGridTheme(
//                     data: SfDataGridThemeData(
//                       frozenPaneElevation: 0.0,
//                       frozenPaneLineColor: Colors.transparent,
//                       frozenPaneLineWidth: 1.5,
//                     ),
//                     child: SfDataGrid(
//                       source: OfficerDataSource(
//                         officerData: controller.officersList,
//                       ),
//                       allowPullToRefresh: true,
//                       columnWidthMode: ColumnWidthMode.auto,
//                       columnWidthCalculationRange:
//                           ColumnWidthCalculationRange.allRows,
//                       onQueryRowHeight: (details) {
//                         // Set the row height as 70.0 to the column header row.
//                         return details.rowIndex == 0 ? 50.0 : 40.0;
//                       },
//                       frozenColumnsCount: 1,
//                       columns: <GridColumn>[
//                         GridColumn(
//                             columnName: 'id',
//                             autoFitPadding: const EdgeInsets.all(10.0),
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'ID',
//                                   softWrap: false,
//                                 ))),
//                         GridColumn(
//                             columnName: 'name',
//                             autoFitPadding: const EdgeInsets.all(10.0),
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'NAME',
//                                 ))),
//                         GridColumn(
//                             columnName: 'phone',
//                             autoFitPadding: const EdgeInsets.all(10.0),
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'PHONE',
//                                 ))),
//                         GridColumn(
//                             columnName: 'email',
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'EMAIL',
//                                 ))),
//                         GridColumn(
//                             columnName: 'gender',
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'GENDER',
//                                 ))),
//                         GridColumn(
//                             columnName: 'location',
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'LOCATION',
//                                 ))),
//                         GridColumn(
//                             columnName: 'levelOfEduc',
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'EDUCATION',
//                                   softWrap: false,
//                                 ))),
//                         GridColumn(
//                             columnName: 'dateOfEmployment',
//                             label: Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   'DOE',
//                                   softWrap: false,
//                                 ))),
//                       ],
//                     ),
//                   );
//                 })),
//           ),
//         ],
//       ),



// Combobox<String>(
//                       placeholder: const Text('Selected list item'),
//                       isExpanded: true,
//                       items: controller.values
//                           .map((e) =>
//                               ComboboxItem<String>(value: e, child: Text(e)))
//                           .toList(),
//                       value: controller.comboBoxValue,
//                       onChanged: (value) {
//                         print(value);
//                       },
//                     )