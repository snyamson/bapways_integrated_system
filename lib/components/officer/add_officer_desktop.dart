import 'package:bapways_integrated_system/components/common/desktop_app_button.dart';
import 'package:bapways_integrated_system/components/officer/value_picker.dart';
import 'package:bapways_integrated_system/controllers/officer_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../common/desktop_form_field.dart';

class AddOfficerDesktop extends GetView<OfficerController> {
  const AddOfficerDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      padding: const EdgeInsets.only(top: 30),
      header: PageHeader(
        title: Obx(
          () => Text(
            controller.isEditing.value ? 'Editing Mode' : 'Add Officer',
            style: const TextStyle(fontWeight: FontWeight.w100),
          ),
        ),
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: controller.addOfficerFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Obx(
                          () => DesktopFormField(
                            header: 'Name',
                            controller: controller.isEditing.isTrue
                                ? TextEditingController.fromValue(
                                    TextEditingValue(
                                        text:
                                            controller.officerDataToEdit.name),
                                  )
                                : controller.nameController,
                            validator: (value) {
                              return controller.validate(value!, 'Name');
                            },
                            onSaved: (value) {
                              controller.name = value!;
                            },
                          ),
                        ),
                        DesktopFormField(
                          header: 'Email',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                      text: controller.officerDataToEdit.email),
                                )
                              : controller.emailController,
                          validator: (value) {
                            return controller.validateEmail(value!, 'Email');
                          },
                          onSaved: (value) {
                            controller.email = value!;
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
                                      text: controller.officerDataToEdit.phone),
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
                          header: 'Location',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                      text: controller
                                          .officerDataToEdit.location),
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
                            label: 'Level of Education',
                            items: controller.eduCert,
                            value: controller.eduCertValue.value == ''
                                ? null
                                : controller.eduCertValue.value,
                            onChanged: (value) {
                              controller.eduCertValue.value = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              DesktopFormField(
                header: 'Date of Employment',
                controller: controller.isEditing.isTrue
                    ? TextEditingController.fromValue(
                        TextEditingValue(
                            text:
                                controller.officerDataToEdit.dateOfEmployment),
                      )
                    : controller.dateOfEmploymentController,
                validator: (value) {
                  return controller.validate(value!, 'Date of Employment');
                },
                onSaved: (value) {
                  controller.dateOfEmployment = value!;
                },
              ),
              const SizedBox(height: 30),
              DesktopAppButton(
                  label: controller.isEditing.isTrue
                      ? 'Save Changes'
                      : 'Submit Form',
                  isEditing: controller.isEditing.value,
                  onPressed: () async {
                    if (controller.isEditing.isTrue) {
                      controller.updateOfficerData();
                      controller.onPageChange(0);
                    } else {
                      await controller.addOfficer(context);
                      await controller.getAllOfficerData();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
