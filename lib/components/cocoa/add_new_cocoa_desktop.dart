import 'package:bapways_integrated_system/controllers/cocoa_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

import '../common/desktop_app_button.dart';
import '../common/desktop_form_field.dart';

class AddNewCocoaDesktop extends GetView<CocoaController> {
  const AddNewCocoaDesktop({Key? key}) : super(key: key);

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
      )),
      content: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: controller.addCocoaDistributionFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DesktopFormField(
                          header: 'Farmer ID',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.cocoaDataToEdit.clientId,
                                  ),
                                )
                              : controller.farmerIdController,
                          validator: (value) {
                            return controller.validate(value!, 'Farmer ID');
                          },
                          onSaved: (value) {
                            controller.farmerId = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'Kg To Company',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text:
                                        controller.cocoaDataToEdit.kgToCompany,
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
                        DesktopFormField(
                          header: 'Total Bags',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.cocoaDataToEdit.bags,
                                  ),
                                )
                              : controller.totalBagsController,
                          validator: (value) {
                            return controller.validate(value!, 'Total Bags');
                          },
                          onSaved: (value) {
                            controller.bags = value!;
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
                          header: 'Client Name',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.cocoaDataToEdit.clientName,
                                  ),
                                )
                              : controller.clientNameController,
                          validator: (value) {
                            return controller.validate(value!, 'Client Name');
                          },
                          onSaved: (value) {
                            controller.clientName = value!;
                          },
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
                        DesktopFormField(
                          header: 'Date of Sale',
                          controller: controller.isEditing.isTrue
                              ? TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: controller.cocoaDataToEdit.dateOfSale,
                                  ),
                                )
                              : controller.dateOfSaleController,
                          validator: (value) {
                            return controller.validate(value!, 'Date of Sale');
                          },
                          onSaved: (value) {
                            controller.dateOfSale = value!;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              DesktopAppButton(
                label: controller.isEditing.isTrue
                    ? 'Save Changes'
                    : 'Submit Form',
                isEditing: controller.isEditing.value,
                onPressed: () async {
                  if (controller.isEditing.isTrue) {
                    await controller.updateCocoaData();
                    // await controller.updateCocoaDistributionEntry(
                    //     controller.cocoaDistributionToEdit.id!, context);
                    controller.onPageChange(0);
                  } else {
                    await controller.addCocoaData();
                    await controller.getAllCocoaData();
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
