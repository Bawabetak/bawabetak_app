import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgMainLight,

    // fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.bgMainLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),

      // titleTextStyle: AppStyles.bigDesdcriptionStyle.copyWith(
      //   fontSize: SizeConfig.textSize * 2.2,
      //   fontFamily: 'Cairo',
      // ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgMainDark,

    // fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.bgMainDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),

      // titleTextStyle: AppStyles.bigDesdcriptionStyle.copyWith(
      //   fontSize: SizeConfig.textSize * 2.2,
      //   fontFamily: 'Cairo',
      // ),
    ),
  );
}
