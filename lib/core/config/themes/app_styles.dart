import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle font14LightGrayMedium() => TextStyle(
    fontSize: AppSizes.fontS,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryDark,
  );
  static TextStyle font28BlackBold() => TextStyle(
    fontSize: AppSizes.fontTitle,
    fontWeight: FontWeight.bold,
    color: AppColors.bgMainDark,
  );
  static TextStyle font24BlackExtraBold() => TextStyle(
    fontSize: AppSizes.fontXXL,
    fontWeight: FontWeight.w800,
    color: AppColors.bgMainDark,
  );
  static TextStyle font16BlackBold() => TextStyle(
    fontSize: AppSizes.fontM,
    fontWeight: FontWeight.bold,
    color: AppColors.bgMainDark,
  );

  static TextStyle font18BlackBold() => TextStyle(
    fontSize: AppSizes.fontL,
    fontWeight: FontWeight.bold,
    color: AppColors.bgMainDark,
  );
}
