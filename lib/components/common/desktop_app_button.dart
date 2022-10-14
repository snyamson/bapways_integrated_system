import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';

class DesktopAppButton extends GetView {
  final String label;
  final VoidCallback onPressed;
  final bool isEditing;

  const DesktopAppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.ElevatedButton.icon(
      icon: const Icon(FluentIcons.add),
      onPressed: onPressed,
      style: material.ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          primary: isEditing
              ? material.Colors.redAccent
              : const material.Color(0xff137500)),
      label: Text(
        label.toUpperCase(),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
