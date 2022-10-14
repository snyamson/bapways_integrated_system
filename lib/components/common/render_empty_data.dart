import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class RenderEmptyData extends GetView {
  const RenderEmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Ionicons.file_tray_outline,
            size: 60,
            color: Color(0xFF999999),
          ),
          PageHeader(
            title: Text(
              'No Data',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
