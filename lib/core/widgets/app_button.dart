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
    this.height = 50,
    this.shape,
    this.elevation=1
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final TextStyle? style;
  final double? height;
  final ShapeBorder? shape;
  final Color? textColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      textColor: textColor,
      minWidth: double.infinity,
      height: height,
      onPressed: onPressed,
      color: color,
      shape: shape ?? StadiumBorder(),
      child: Text(
        text,
        style:
            style ??
            TextStyle(fontSize: AppSizes.fontM, fontWeight: FontWeight.w600),
      ),
    );
  }
}
