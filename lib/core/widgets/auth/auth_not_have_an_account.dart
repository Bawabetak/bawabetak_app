import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuhtNotHaveAnAccount extends StatelessWidget {
  const AuhtNotHaveAnAccount({
    super.key,
    required this.title1,
    required this.title2,
    required this.onPressed,
  });
  final String title1;
  final String title2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.titleMedium!.copyWith(color: AppColors.grey),
        children: [
          TextSpan(text: title1),
          TextSpan(
            text: title2,
            style: TextStyle(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}