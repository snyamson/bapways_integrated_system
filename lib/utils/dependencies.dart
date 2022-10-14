import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:get/get.dart';

import '../controllers/client_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/officer_controller.dart';

void init() async {
  // Initialize Controllers
  Get.lazyPut(() => CocoaController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => OfficerController());
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => ClientController());
}
