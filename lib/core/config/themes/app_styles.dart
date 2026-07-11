import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle font14LightGrayMedium() => TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryDark,
  );
  static  TextStyle font28BlackBold() => TextStyle(
    fontSize: AppSizes.fontTitle,
    fontWeight: FontWeight.bold,
    color: AppColors.bgMainDark,
  );
}
