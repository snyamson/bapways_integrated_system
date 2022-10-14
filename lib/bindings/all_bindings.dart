import 'package:bapways_integrated_system/controllers/home_controller.dart';
import 'package:bapways_integrated_system/controllers/officer_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OfficerController());
  }
}
