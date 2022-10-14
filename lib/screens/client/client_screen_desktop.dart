import 'package:bapways_integrated_system/components/client/add_client_desktop.dart';
import 'package:bapways_integrated_system/components/client/all_client_desktop.dart';
import 'package:bapways_integrated_system/controllers/client_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class ClientScreenDesktop extends GetView<ClientController> {
  const ClientScreenDesktop({Key? key}) : super(key: key);

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
                text: Text('All Clients'),
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
              AllClientDesktop(),
              AddClientDesktop()
            ]),
      ),
    );
  }
}
