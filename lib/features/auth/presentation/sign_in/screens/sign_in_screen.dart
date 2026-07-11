import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/auth/auth_not_have_an_account.dart';
import 'package:bawabak/core/widgets/auth/auth_stack_image.dart';
import 'package:bawabak/features/auth/presentation/sign_in/widgets/sign_in_form.dart';
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
                  child: Text('Login', style: context.textTheme.headlineMedium),
                ),

                const VerticalSpace(30),
                SignInForm(),

                const VerticalSpace(13),
                Center(
                  child: AuhtNotHaveAnAccount(
                    title1: "Don't have an account?",
                    title2: " Sign Up",
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.signUp);
                    },
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
