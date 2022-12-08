import 'package:bapways_integrated_system/controllers/auth_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class OnRowTap extends GetView {
  final AuthController auth = Get.find<AuthController>();

  final String name;
  final String otherDetail;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  OnRowTap(
      {required this.name,
      required this.otherDetail,
      required this.onEditPressed,
      required this.onDeletePressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Text(name),
      content: Text(otherDetail),
      actions: [
        OutlinedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            }),
        FilledButton(onPressed: onEditPressed, child: const Text('Edit')),
        if (auth.currentUser.role == 'Author')
          FilledButton(
            onPressed: onDeletePressed,
            style: ButtonStyle(
              backgroundColor: ButtonState.resolveWith((states) => Colors.red),
            ),
            child: const Text('Delete'),
          )
      ],
    );
  }
}
