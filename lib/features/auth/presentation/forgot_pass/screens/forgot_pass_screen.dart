import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/utils/assets.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/widgets/forgot_pass_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
          child: Column(
            children: [
              const VerticalSpace(10),

              Text(
                "Forgot Password",
                style: context.textTheme.headlineMedium,

                textAlign: TextAlign.center,
              ),
              const VerticalSpace(10),

              Text(
                textAlign: TextAlign.center,
                "Enter your email address to verify and\n reset your email",
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.grey,
                ),
              ),

              const VerticalSpace(10),
              Image.asset(
                Assets.assetsImagesForgotPass,
                width: 250.w,

                height: 250.w,
              ),

              const VerticalSpace(20),
              ForgotPassForm(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
