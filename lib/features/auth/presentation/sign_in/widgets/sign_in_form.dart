import 'dart:developer';

import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/functions/toast_alert.dart';
import 'package:bawabak/core/helpers/app_validator.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/data/models/verify_email_screen_model.dart';
import 'package:bawabak/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.signInFormKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) => AppValidators.email(value),
            controller: cubit.emailController,
            // keyboardType: TextInputType.emailAddress,
            hint: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.grey, size: 23),
          ),
          const VerticalSpace(18),
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (previous, current) =>
                previous.showPassword != current.showPassword,
            builder: (context, state) {
              return AppTextFormField(
                validator: (value) => AppValidators.password(value),
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
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.forgotPass);
              },
              child: Text(
                'Forgot the password?',
                style: context.textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          const VerticalSpace(13),

          BlocConsumer<SignInCubit, SignInState>(
            buildWhen: (previous, current) => previous.signIn != current.signIn,
            listenWhen: (previous, current) =>
                previous.signIn != current.signIn ||
                previous.sendOtpCode != current.sendOtpCode,
            listener: (context, state) async {
              if (state.signIn.isError) {
                toastAlert(msg: state.signIn.error!, color: AppColors.redColor);
              } else if (state.signIn.isSuccess) {
                if (!state.signIn.data!.isEmailVerified) {
                  await cubit.resendOtpCodeToEmail();
                } else if (!state.signIn.data!.isCompleteRegistration) {
                  log("not complete registration");
                } else if (!state.signIn.data!.isApproved) {
                  log("not approved");
                } else {
                  ////login
                }
              }
              ///for resend otp
              else if (state.sendOtpCode.isSuccess) {
                //we will navigate to complete info
                context.pushNamed(
                  AppRoutes.verifyEmail,
                  arguments: VerifyEmailScreenModel(
                    type: VerificationType.otp,
                    fromSignUp: true,
                    nextRoute: AppRoutes.onboarding,
                    email: cubit.emailController.text,
                  ),
                );
              } else if (state.sendOtpCode.isError) {
                toastAlert(
                  msg: state.sendOtpCode.error!,
                  color: AppColors.redColor,
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                text: state.signIn.isLoading ? "Loading..." : "Sign In",
                onPressed: () {
                  if (cubit.signInFormKey.currentState!.validate()) {
                    cubit.signInWithEmailAndPassword();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
