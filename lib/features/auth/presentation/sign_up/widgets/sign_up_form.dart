import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/data/models/verify_email_screen_model.dart';
import 'package:bawabak/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Form(
      key: cubit.signUpFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            hint: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.grey, size: 23),
          ),
          const VerticalSpace(18),
          BlocBuilder<SignUpCubit, SignUpState>(
            buildWhen: (previous, current) =>
                previous.showPassword != current.showPassword,
            builder: (context, state) {
              return AppTextFormField(
                controller: cubit.passwordController,
                obscureText: !state.showPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.togglePasswordIcon();
                  },
                  icon: Icon(
                    state.showPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.grey,
                    size: 23,
                  ),
                ),
                hint: "Password",
                prefixIcon: Icon(Icons.lock, color: AppColors.grey, size: 23),
              );
            },
          ),

          const VerticalSpace(13),

          AppButton(
            text: "Sign Up",
            onPressed: () {
              if (cubit.signUpFormKey.currentState!.validate()) {
                ///call api
                ///
                context.pushNamed(
                  AppRoutes.verifyEmail,
                  arguments: VerifyEmailScreenModel(
                    fromSignUp: true,
                    nextRoute: AppRoutes.onboarding,
                    email: cubit.emailController.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
