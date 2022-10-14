import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../../components/auth/main.dart';
import '../../components/auth/sidebar.dart';

class AuthScreenDesktop extends GetView {
  const AuthScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [SideBar(), Main()],
    );
  }
}
