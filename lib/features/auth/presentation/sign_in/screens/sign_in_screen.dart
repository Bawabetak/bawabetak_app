import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/core/widgets/auth/auth_not_have_an_account.dart';
import 'package:bawabak/core/widgets/auth/auth_stack_image.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthStackImag(),

                Align(
                  child: Text(
                    'Sign in to your account',
                    style: context.textTheme.headlineSmall,
                  ),
                ),

                const VerticalSpace(30),
                AppTextFormField(
                  hint: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.grey,
                    size: 23,
                  ),
                ),
                const VerticalSpace(18),
                AppTextFormField(
                  hint: "Password",
                  prefixIcon: Icon(Icons.lock, color: AppColors.grey, size: 23),
                ),
                const VerticalSpace(13),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot the password?',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const VerticalSpace(13),

                AppButton(text: "Sign In", onPressed: () {}),
                const VerticalSpace(13),
                Center(
                  child: AuhtNotHaveAnAccount(
                    title1: "Don't have an account?",
                    title2: " Sign Up",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
