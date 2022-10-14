import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class DesktopFormField extends GetView {
  final bool? isPasswordField;
  final String header;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  @override
  final TextEditingController? controller;
  const DesktopFormField(
      {this.isPasswordField,
      required this.header,
      this.validator,
      this.onSaved,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormBox(
      header: header,
      controller: controller,
      obscureText: isPasswordField ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
