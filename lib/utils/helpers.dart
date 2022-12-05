import 'package:flutter/material.dart';

class Helpers {
  static Future<DateTime?> getDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.inputOnly,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2121),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff137500),
                onPrimary: Colors.white,
              ),
            ),
            child: child!,
          );
        });
  }
}
