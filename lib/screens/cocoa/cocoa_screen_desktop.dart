import 'package:bapways_integrated_system/components/cocoa/add_new_cocoa_desktop.dart';
import 'package:bapways_integrated_system/components/cocoa/all_cocoa_data_desktop.dart';
import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../../components/cocoa/add_new_cocoa_desktop.dart';

class CocoaScreenDesktop extends GetView<CocoaController> {
  const CocoaScreenDesktop({Key? key}) : super(key: key);

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
                text: Text('All Cocoa Distribution'),
                closeIcon: FluentIcons.tab,
                icon: Icon(FluentIcons.list),
              ),
              Tab(
                text: Text('Add New Entry'),
                closeIcon: FluentIcons.tab,
                icon: Icon(FluentIcons.add),
              ),
            ],
            bodies: const [
              AllCocoaDataDesktop(),
              AddNewCocoaDesktop()
            ]),
      ),
    );
  }
}
