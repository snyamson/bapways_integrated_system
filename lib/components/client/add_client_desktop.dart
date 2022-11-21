import 'package:bapways_integrated_system/components/common/desktop_app_button.dart';
import 'package:bapways_integrated_system/components/common/desktop_form_field.dart';
import 'package:bapways_integrated_system/controllers/client_controller.dart';
import 'package:bapways_integrated_system/controllers/officer_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../officer/value_picker.dart';

class AddClientDesktop extends GetView<ClientController> {
  const AddClientDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final officerController = Get.find<OfficerController>();

    return ScaffoldPage.withPadding(
      padding: const EdgeInsets.only(top: 30),
      header: PageHeader(
          title: Obx(
        () => Text(
          controller.isEditing.value ? 'Editing Mode' : 'Add Client',
          style: const TextStyle(fontWeight: FontWeight.w100),
        ),
      )),
      content: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: controller.addClientFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DesktopFormField(
                          header: 'Name',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.clientDataToEdit.name,
                                  ),
                                )
                              : controller.nameController,
                          validator: (value) {
                            return controller.validate(value!, 'Name');
                          },
                          onSaved: (value) {
                            controller.name = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'Location',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.clientDataToEdit.location,
                                  ),
                                )
                              : controller.locationController,
                          validator: (value) {
                            return controller.validate(value!, 'Location');
                          },
                          onSaved: (value) {
                            controller.location = value!;
                          },
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => ValuePicker(
                            label: 'Gender',
                            items: controller.gender,
                            value: controller.genderValue.value == ''
                                ? null
                                : controller.genderValue.value,
                            onChanged: (value) {
                              controller.genderValue.value = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        DesktopFormField(
                          header: 'Farm Size',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.clientDataToEdit.farmSize,
                                  ),
                                )
                              : controller.farmSizeController,
                          validator: (value) {
                            return controller.validate(value!, 'Farm Size');
                          },
                          onSaved: (value) {
                            controller.farmSize = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        DesktopFormField(
                          header: 'Phone',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.clientDataToEdit.phone,
                                  ),
                                )
                              : controller.phoneController,
                          validator: (value) {
                            return controller.validate(value!, 'Phone');
                          },
                          onSaved: (value) {
                            controller.phone = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'District',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.clientDataToEdit.district,
                                  ),
                                )
                              : controller.districtController,
                          validator: (value) {
                            return controller.validate(value!, 'District');
                          },
                          onSaved: (value) {
                            controller.district = value!;
                          },
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => ValuePicker(
                            label: 'Crop Type',
                            items: controller.cropTypes,
                            value: controller.cropTypeValue.value == ''
                                ? null
                                : controller.cropTypeValue.value,
                            onChanged: (value) {
                              controller.cropTypeValue.value = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        DesktopFormField(
                          header: 'Date of Registration',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                      text: controller
                                          .clientDataToEdit.dateOfRegistration),
                                )
                              : controller.dateOfRegistrationController,
                          validator: (value) {
                            return controller.validate(
                                value!, 'Date of Registration');
                          },
                          onSaved: (value) {
                            controller.dateOfRegistration = value!;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Obx(
                () => InfoLabel(
                  label: 'Registered By',
                  child: Combobox<String>(
                    placeholder: const Text('Select'),
                    isExpanded: true,
                    items: officerController.officersList
                        .map(
                          (c) => ComboboxItem<String>(
                            value: '${c.id}',
                            child: Text(c.name),
                          ),
                        )
                        .toList(),
                    value: controller.registeredBy.value == ''
                        ? null
                        : controller.registeredBy.value,
                    onChanged: (value) {
                      controller.registeredBy.value = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              DesktopAppButton(
                label: controller.isEditing.isTrue
                    ? 'Save Changes'
                    : 'Submit Form',
                isEditing: controller.isEditing.value,
                onPressed: () {
                  if (controller.isEditing.isTrue) {
                    controller.updateClientData();
                    controller.onPageChange(0);
                  } else {
                    controller.addClient();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
