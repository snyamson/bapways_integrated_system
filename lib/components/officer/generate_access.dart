import 'package:bapways_integrated_system/components/common/desktop_app_button.dart';
import 'package:bapways_integrated_system/components/common/desktop_form_field.dart';
import 'package:bapways_integrated_system/controllers/auth_controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class GenerateAccess extends GetView<AuthController> {
  const GenerateAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: const PageHeader(
        title: Text(
          'Generate Access',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: controller.authFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        DesktopFormField(
                          header: 'Username',
                          controller: controller.usernameController,
                          validator: (value) {
                            return controller.validate(value!, 'Username');
                          },
                          onSaved: (value) {
                            controller.username = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'FullName',
                          controller: controller.fullNameController,
                          validator: (value) {
                            return controller.validate(value!, 'FullName');
                          },
                          onSaved: (value) {
                            controller.fullName = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'Role',
                          controller: controller.roleController,
                          validator: (value) {
                            return controller.validate(value!, 'Role');
                          },
                          onSaved: (value) {
                            controller.role = value!;
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
                          header: 'Password',
                          controller: controller.passwordController,
                          validator: (value) {
                            return controller.validate(value!, 'Password');
                          },
                          onSaved: (value) {
                            controller.password = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'Email',
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validate(value!, 'Email');
                          },
                          onSaved: (value) {
                            controller.email = value!;
                          },
                        ),
                        DesktopFormField(
                          header: 'Position',
                          controller: controller.positionController,
                          validator: (value) {
                            return controller.validate(value!, 'Position');
                          },
                          onSaved: (value) {
                            controller.position = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              DesktopAppButton(
                isEditing: false,
                label: 'Generate Access',
                onPressed: () async {
                  controller.generateAccess();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
