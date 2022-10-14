import 'package:bapways_integrated_system/controllers/home_controller.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../common/window_buttons.dart';

class HomeDesktop extends GetView<HomeController> {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (GetPlatform.isDesktop)
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  const WindowButtons(),
                ],
              ),
            ),
          Expanded(
            child: NavigationView(
              pane: NavigationPane(
                leading: const Text('Leading'),
                header: Text('${controller.index}'),
                displayMode: PaneDisplayMode.auto,
                items: [
                  PaneItem(
                    icon: const Icon(FluentIcons.access_logo),
                    title: const Text('DASHBOARD'),
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.access_logo),
                    title: const Text('CLIENT'),
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.access_logo),
                    title: const Text('OFFICER'),
                  ),
                  PaneItem(
                    icon: const Icon(FluentIcons.access_logo),
                    title: const Text('COCOA DISTRIBUTION'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
