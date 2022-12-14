import 'package:bapways_integrated_system/controllers/auth_controller.dart';
import 'package:bapways_integrated_system/controllers/home_controller.dart';
import 'package:bapways_integrated_system/screens/client/client_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/cocoa/cocoa_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/officer/officer_screen_desktop.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../components/common/window_buttons.dart';

class HomeScreenDesktop extends GetView<HomeController> {
  HomeScreenDesktop({Key? key}) : super(key: key);
  final AuthController auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                const WindowButtons(),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => NavigationView(
                pane: NavigationPane(
                  selected: controller.index.value,
                  onChanged: (int index) {
                    controller.onPageChange(index);
                  },
                  displayMode: PaneDisplayMode.auto,
                  footerItems: [
                    PaneItemAction(
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Ionicons.log_out_outline, size: 24),
                            SizedBox(width: 10),
                            Text('Log Out')
                          ],
                        ),
                        onTap: () async {
                          await auth.signOut(context);
                        })
                  ],
                  items: [
                    PaneItemHeader(
                        header: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name    : ${auth.currentUser.fullName}'),
                        Text('Email     : ${auth.currentUser.email}'),
                        Text('Position : ${auth.currentUser.position}'),
                        Text('Role       : ${auth.currentUser.role}'),
                      ],
                    )),
                    PaneItemSeparator(),
                    PaneItem(
                      icon: const Icon(Ionicons.people_outline),
                      title: const Text('CLIENT'),
                    ),
                    PaneItem(
                      icon: const Icon(Ionicons.person_outline),
                      title: const Text('OFFICER'),
                    ),
                    PaneItem(
                      icon: const Icon(Ionicons.leaf_outline),
                      title: const Text('COCOA DISTRIBUTION'),
                    )
                  ],
                ),
                content: NavigationBody(
                  index: controller.index.value,
                  children: [
                    const ClientScreenDesktop(),
                    OfficerScreenDesktop(),
                    const CocoaScreenDesktop()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
