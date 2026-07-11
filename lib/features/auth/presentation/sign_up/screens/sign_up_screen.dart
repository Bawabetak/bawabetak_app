import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/auth/auth_not_have_an_account.dart';
import 'package:bawabak/core/widgets/auth/auth_stack_image.dart';
import 'package:bawabak/features/auth/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    'Sign Up',
                    style: context.textTheme.headlineSmall,
                  ),
                ),

                const VerticalSpace(30),
                SignUpForm(),

                const VerticalSpace(13),
                Center(
                  child: AuhtNotHaveAnAccount(
                    title1: "Already have an account?",
                    title2: " Sign In",
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.signIn);
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
