import 'package:elegant_notification/elegant_notification.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:ionicons/ionicons.dart';

class AppNotificationDesktop {
  final BuildContext context;
  final String message;
  AppNotificationDesktop.error({required this.context, required this.message}) {
    ElegantNotification(
      title: const Text('Error'),
      description: Text(message),
      icon: const Icon(
        Ionicons.alert_circle_outline,
        size: 30,
        color: material.Colors.redAccent,
      ),
      progressIndicatorColor: material.Colors.redAccent,
    ).show(context);
  }

  AppNotificationDesktop.success(
      {required this.context, required this.message}) {
    ElegantNotification(
      title: const Text('Success'),
      description: Text(message),
      icon: const Icon(
        Ionicons.checkmark_circle_outline,
        size: 30,
        color: material.Color(0xff137500),
      ),
      progressIndicatorColor: const material.Color(0xff137500),
    ).show(context);
  }
}
