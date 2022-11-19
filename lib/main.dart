import 'package:bapways_integrated_system/bindings/all_bindings.dart';
import 'package:bapways_integrated_system/db/db_helper.dart';
import 'package:bapways_integrated_system/screens/auth/auth_screen_mobile.dart';
import 'package:bapways_integrated_system/screens/home/home_screen_desktop.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:bapways_integrated_system/utils/dependencies.dart ' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.initDb();

  if (GetPlatform.isDesktop) {
    const initialSize = Size(1024, 600);
    appWindow.minSize = initialSize;
    appWindow.title = 'Bapways Integrated System';
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isDesktop) {
      dep.init();

      return FluentApp(
        debugShowCheckedModeBanner: false,
        title: 'Bapways Integrated System',
        theme: ThemeData(
          accentColor: Colors.green,
          activeColor: const material.Color(0xff137500),
          borderInputColor: const material.Color(0xff137500),
        ),
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        home: const HomeScreenDesktop(),
      );
    } else {
      return GetMaterialApp(
        initialBinding: AllBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Bapways Integrated System',
        home: const AuthScreenMobile(),
      );
    }
  }
}
