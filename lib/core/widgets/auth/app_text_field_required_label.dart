import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:flutter/material.dart';

class AppTextFieldRequiredLabel extends StatelessWidget {
  const AppTextFieldRequiredLabel({super.key, required this.lable});

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: context.textTheme.titleMedium,
            children: [
              TextSpan(text: lable),
              TextSpan(
                text: '*',
                style: TextStyle(color: AppColors.redColor),
              ),
            ],
          ),
        ),
        const VerticalSpace(5),
      ],
    );
  }
}