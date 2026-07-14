import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/functions/toast_alert.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/data/models/verify_email_screen_model.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/manager/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassForm extends StatelessWidget {
  const ForgotPassForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Form(
      key: cubit.forgotPassFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            // keyboardType: TextInputType.emailAddress,
            hint: "Email Address",
            prefixIcon: Icon(Icons.email, color: AppColors.grey, size: 23),
          ),

          const VerticalSpace(35),
          BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listenWhen: (previous, current) =>
                previous.sendOtpCode != current.sendOtpCode,
            buildWhen: (previous, current) =>
                previous.sendOtpCode != current.sendOtpCode,
            listener: (context, state) {
              if (state.sendOtpCode.isSuccess) {
                context.pushNamed(
                  AppRoutes.verifyEmail,
                  arguments: VerifyEmailScreenModel(
                    type: VerificationType.forgotPassword,
                    fromSignUp: false,
                    nextRoute: AppRoutes.resetPass,
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
            builder: (context, state) => AppButton(
              text: state.sendOtpCode.isLoading
                  ? "Sending..."
                  : "Send Verification Code",
              onPressed: () {
                if (cubit.forgotPassFormKey.currentState!.validate()) {
                  cubit.resendOtpCodeToEmail();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
