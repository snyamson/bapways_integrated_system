import 'package:get/get.dart';

class HomeController extends GetxController {
  var index = 0.obs;

  void onPageChange(int newIndex) {
    index.value = newIndex;
  }
}
