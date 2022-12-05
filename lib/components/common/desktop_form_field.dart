import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class DesktopFormField extends GetView {
  final bool? isPasswordField;
  final String header;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? widget;
  final String? hintText;
  final bool? readOnly;

  @override
  final TextEditingController? controller;
  const DesktopFormField({
    this.isPasswordField,
    required this.header,
    this.validator,
    this.onSaved,
    this.controller,
    this.widget,
    this.hintText,
    this.readOnly,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormBox(
            header: header,
            controller: controller,
            obscureText: isPasswordField ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            placeholder: hintText,
            readOnly: widget != null || readOnly == true ? true : false,
            validator: validator,
            onSaved: onSaved,
          ),
        ),
        widget != null
            ? Container(margin: const EdgeInsets.only(left: 20), child: widget)
            : Container(),
      ],
    );
  }
}
