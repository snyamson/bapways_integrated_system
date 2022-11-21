import 'package:bapways_integrated_system/components/common/app_notification_desktop.dart';
import 'package:bapways_integrated_system/controllers/auth_controller.dart';
import 'package:bapways_integrated_system/screens/home/home_screen_desktop.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';

import '../common/window_buttons.dart';

class Main extends GetView<AuthController> {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  const WindowButtons()
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Center(
                  child: Form(
                    key: controller.authScreenFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormBox(
                          header: 'Username',
                          controller: controller.authUsernameController,
                          validator: (value) {
                            return controller.validate(value!, 'Username');
                          },
                          onSaved: (value) {
                            controller.authUsername = value!;
                          },
                          style: const TextStyle(fontSize: 16),
                          decoration: const BoxDecoration(),
                        ),
                        TextFormBox(
                          header: 'Password',
                          controller: controller.authPasswordController,
                          validator: (value) {
                            return controller.validate(value!, 'Password');
                          },
                          onSaved: (value) {
                            controller.authPassword = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        material.ElevatedButton(
                          style: material.ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: const material.Color(0xff137500),
                          ),
                          child: const Text('Log In'),
                          onPressed: () async {
                            await controller.getCurrentUser();
                            if (controller.isUserFound.isFalse &&
                                controller.isAuthSubmitted.isTrue) {
                              AppNotificationDesktop.error(
                                  context: context,
                                  message: 'Username or Password Incorrect');
                            } else {
                              Navigator.pushAndRemoveUntil(
                                context,
                                FluentPageRoute(
                                  builder: (context) => HomeScreenDesktop(),
                                ),
                                (route) => false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
