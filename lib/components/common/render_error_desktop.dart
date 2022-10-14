import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class RenderErrorDesktop extends GetView {
  final String errorText;
  final VoidCallback onPressed;
  const RenderErrorDesktop(
      {required this.errorText, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: const Text(
        'Error Occurred',
        style: TextStyle(color: Color(0xFFFF3333), fontWeight: FontWeight.w100),
      ),
      content: Text(errorText),
      actions: [
        FilledButton(
          onPressed: onPressed,
          child: const Text('Retry'),
        )
      ],
    );
  }
}
