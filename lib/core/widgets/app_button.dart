import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.bgMainLight,
    this.style,
    this.height = 55,
    this.shape,
    this.elevation = 1,
    this.splashColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final TextStyle? style;
  final double? height;
  final ShapeBorder? shape;
  final Color? textColor;
  final double? elevation;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: splashColor,
      elevation: elevation,
      textColor: textColor,
      minWidth: double.infinity,
      height: height,
      onPressed: onPressed,
      color: color,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style:
            style ??
            TextStyle(fontSize: AppSizes.fontM, fontWeight: FontWeight.w600),
      ),
    );
  }
}
