import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastAlert({required String msg, required Color color}) {
  showToast(msg, color: color);
}

void showToast(String msg, {Color color = AppColors.primaryColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16,
  );
}
