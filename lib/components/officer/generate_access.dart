import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class GenerateAccess extends GetView {
  const GenerateAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: const PageHeader(
        title: Text(
          'Generate Access',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: Container(),
    );
  }
}
