import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/controllers/client_controller.dart';
import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:bapways_integrated_system/utils/helpers.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common/desktop_app_button.dart';
import '../common/desktop_form_field.dart';

class AddNewCocoaDesktop extends GetView<CocoaController> {
  AddNewCocoaDesktop({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      padding: const EdgeInsets.only(top: 30),
      header: PageHeader(
        title: Obx(
          () => Text(
            controller.isEditing.value ? 'Editing Mode' : 'Add New Entry',
            style: const TextStyle(fontWeight: FontWeight.w100),
          ),
        ),
      ),
      content: Form(
        key: controller.addCocoaDistributionFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => InfoLabel(
                          label: 'Farmer Id',
                          child: Combobox<String>(
                            placeholder: const Text('Select'),
                            isExpanded: true,
                            items: clientController.clientsList
                                .map(
                                  (c) => ComboboxItem<String>(
                                    value: c.clientId,
                                    child: Text(c.clientId),
                                  ),
                                )
                                .toList(),
                            value: controller.selectedClientId.value == ''
                                ? null
                                : controller.selectedClientId.value,
                            onChanged: (value) {
                              controller.selectedClientId.value = value!;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      DesktopFormField(
                        header: 'Kg To Company',
                        controller: controller.isEditing.isTrue
                            ? TextEditingController.fromValue(
                                TextEditingValue(
                                  text: controller.cocoaDataToEdit.kgToCompany,
                                ),
                              )
                            : controller.kgToCompanyController,
                        validator: (value) {
                          return controller.validate(value!, 'Kg To Company');
                        },
                        onSaved: (value) {
                          controller.kgToCompany = value!;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Obx(
                        () => DesktopFormField(
                          header: 'Client Name',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.cocoaDataToEdit.clientName,
                                  ),
                                )
                              : TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.selectedClientId.isEmpty
                                        ? ''
                                        : clientController.clientsList
                                            .firstWhere(
                                              (client) =>
                                                  client.clientId ==
                                                  controller
                                                      .selectedClientId.value,
                                            )
                                            .name,
                                  ),
                                ),
                          validator: (value) {
                            return controller.validate(value!, 'Client Name');
                          },
                          onSaved: (value) {
                            controller.clientName = value!;
                          },
                          readOnly: true,
                        ),
                      ),
                      DesktopFormField(
                        header: 'Kg To Client',
                        controller: controller.isEditing.isTrue
                            ? TextEditingController.fromValue(
                                TextEditingValue(
                                  text: controller.cocoaDataToEdit.kgToClient,
                                ),
                              )
                            : controller.kgToClientController,
                        validator: (value) {
                          return controller.validate(value!, 'Kg To Client');
                        },
                        onSaved: (value) {
                          controller.kgToClient = value!;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Obx(
              () => DesktopFormField(
                header: 'Date of Sale',
                hintText: DateFormat.yMMMEd()
                    .format(controller.selectedDate.value)
                    .toString(),
                widget: IconButton(
                  icon: const Icon(FluentIcons.calendar),
                  onPressed: () async {
                    DateTime? pickerDate = await Helpers.getDate(context);

                    if (pickerDate != null) {
                      controller.selectedDate.value = pickerDate;
                    } else {
                      AppNotificationDesktop.error(
                        context: context,
                        message: 'No date was selected',
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            DesktopAppButton(
              label:
                  controller.isEditing.isTrue ? 'Save Changes' : 'Submit Form',
              isEditing: controller.isEditing.value,
              onPressed: () async {
                if (controller.isEditing.isTrue) {
                  await controller.updateCocoaData();
                  controller.onPageChange(0);
                } else {
                  await controller.addCocoaData(context);
                  await controller.getAllCocoaData();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
