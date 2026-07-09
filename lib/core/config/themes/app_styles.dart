import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static font14BlackRegular() => TextStyle(
    fontSize: AppSizes.fontS,
    color: AppColors.bgMainDark,
    fontWeight: FontWeight.w400,
  );
}
