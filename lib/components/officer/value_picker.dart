import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class ValuePicker extends GetView {
  final String label;
  final List items;
  final Function(String?)? onChanged;
  final String? value;
  const ValuePicker(
      {required this.label,
      required this.items,
      required this.onChanged,
      this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoLabel(
      label: label,
      child: Combobox<String>(
        placeholder: const Text('Select'),
        isExpanded: true,
        items: items
            .map((e) => ComboboxItem<String>(value: e, child: Text(e)))
            .toList(),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
