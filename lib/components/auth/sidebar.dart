import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';

class SideBar extends GetView {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: context.isTablet ? Get.width * 0.55 : Get.width * 0.6,
      child: Column(
        children: [
          WindowTitleBarBox(
            child: MoveWindow(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const material.Image(
                  image: AssetImage('assets/logo.jpg'),
                ),
                const SizedBox(height: 30),
                Text(
                  'integrated system'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
