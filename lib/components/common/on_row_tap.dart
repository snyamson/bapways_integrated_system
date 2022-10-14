import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class OnRowTap extends GetView {
  final String name;
  final String otherDetail;
  final VoidCallback onEditPressed;
  const OnRowTap(
      {required this.name,
      required this.otherDetail,
      required this.onEditPressed,
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
        FilledButton(onPressed: onEditPressed, child: const Text('Edit'))
      ],
    );
  }
}
