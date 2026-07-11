import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/utils/assets.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/widgets/reset_pass_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create new password")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
          child: Column(
            children: [
              const VerticalSpace(20),
              Image.asset(
                Assets.assetsImagesForgotPass,
                width: 250.w,
                height: 250.w,
              ),

              ResetPassForm(email: email),
            ],
          ),
        ),
      ),
    );
  }
}
