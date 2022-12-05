import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';

class ExportDataModal extends StatelessWidget {
  const ExportDataModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CocoaController>();
    return ContentDialog(
      title: const Text('Export Data Options'),
      content: const Text('Export Database data as '),
      actions: [
        OutlinedButton(
          onPressed: () async {
            //  await controller.exportDataGridToExcel();
          },
          child: const Text('Xlsx Doc'),
        ),
        FilledButton(
          onPressed: () {
            // controller.exportDataGridToPdf();
          },
          child: const Text('PDF Doc'),
        ),
        material.ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: material.ElevatedButton.styleFrom(
            primary: material.Colors.redAccent,
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
