import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/config/themes/app_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgMainLight,

    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.bgMainLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
      titleTextStyle: AppStyles.font18BlackBold(),
    ),

    textTheme: TextTheme(
      labelLarge: AppStyles.font14LightGrayMedium(),
      headlineMedium: AppStyles.font28BlackBold(),
      headlineSmall: AppStyles.font24BlackExtraBold(),
      titleMedium: AppStyles.font16BlackBold(),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.bgMainDark,

    fontFamily: 'Cairo',
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.bgMainDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: AppStyles.font18BlackBold().copyWith(
        color: AppColors.bgMainLight,
      ),
    ),

    textTheme: TextTheme(
      labelLarge: AppStyles.font14LightGrayMedium(),
      headlineMedium: AppStyles.font28BlackBold().copyWith(
        color: AppColors.bgMainLight,
      ),
      headlineSmall: AppStyles.font24BlackExtraBold().copyWith(
        color: AppColors.bgMainLight,
      ),
      titleMedium: AppStyles.font16BlackBold().copyWith(
        color: AppColors.bgMainLight,
      ),
    ),
  );
}


// | Style          | Size |
// | -------------- | ---: |
// | displayLarge   |   57 |
// | displayMedium  |   45 |
// | displaySmall   |   36 |
// | headlineLarge  |   32 |
// | headlineMedium |   28 |
// | headlineSmall  |   24 |
// | titleLarge     |   22 |
// | titleMedium    |   16 |
// | titleSmall     |   14 |
// | bodyLarge      |   16 |
// | bodyMedium     |   14 |
// | bodySmall      |   12 |
// | labelLarge     |   14 |
// | labelMedium    |   12 |
// | labelSmall     |   11 |

