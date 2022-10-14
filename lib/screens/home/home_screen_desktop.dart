import 'package:bapways_integrated_system/controllers/home_controller.dart';
import 'package:bapways_integrated_system/screens/client/client_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/cocoa/cocoa_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/dashboard/dashboard_screen_desktop.dart';
import 'package:bapways_integrated_system/screens/officer/officer_screen_desktop.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../components/common/window_buttons.dart';

class HomeScreenDesktop extends GetView<HomeController> {
  const HomeScreenDesktop({Key? key}) : super(key: key);

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
                        onTap: () {})
                  ],
                  items: [
                    PaneItemHeader(
                        header: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name    : Solomon Nyamson'),
                        Text('Email     : info.snyamson@gmail.com'),
                        Text('Position : Amin'),
                        Text('Role       : User'),
                      ],
                    )),
                    PaneItemSeparator(),
                    PaneItem(
                      icon: const Icon(Ionicons.grid_outline),
                      title: const Text('DASHBOARD'),
                    ),
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
                  children: const [
                    DashboardScreenDesktop(),
                    ClientScreenDesktop(),
                    OfficerScreenDesktop(),
                    CocoaScreenDesktop()
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
