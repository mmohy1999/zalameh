import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zalameha/core/theming/colors.dart';

enum ToastType { error, confirm }

class ToastHelper {
  static void showToast({
    required String message,
    ToastType type = ToastType.confirm,
  }) {
    Color bgColor;
    switch (type) {
      case ToastType.error:
        bgColor = Colors.red;
        break;
      case ToastType.confirm:
        bgColor = ColorsManager.primaryColor;
        break;
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
