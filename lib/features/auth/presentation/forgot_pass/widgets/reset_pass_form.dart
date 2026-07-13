import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/extensions/navigate_extensions.dart';
import 'package:bawabak/core/functions/toast_alert.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/manager/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassForm extends StatelessWidget {
  const ResetPassForm({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Form(
      key: cubit.resetPassFormKey,
      child: Column(
        children: [
          const VerticalSpace(13),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.showPass != current.showPass,
            builder: (context, state) {
              return AppTextFormField(
                controller: cubit.passController,
                obscureText: !state.showPass,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.togglePasswordIcon();
                  },
                  icon: Icon(
                    state.showPass ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.grey,
                    size: 23,
                  ),
                ),
                hint: "New Password",
                prefixIcon: Icon(Icons.lock, color: AppColors.grey, size: 23),
              );
            },
          ),

          const VerticalSpace(17),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.showPass != current.showPass,
            builder: (context, state) {
              return AppTextFormField(
                controller: cubit.confirmPassController,
                obscureText: !state.showPass,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.togglePasswordIcon();
                  },
                  icon: Icon(
                    state.showPass ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.grey,
                    size: 23,
                  ),
                ),
                hint: "Confirm Password",
                prefixIcon: Icon(Icons.lock, color: AppColors.grey, size: 23),
              );
            },
          ),
          const VerticalSpace(20),

          BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listenWhen: (previous, current) =>
                previous.resetPass != current.resetPass,
            buildWhen: (previous, current) =>
                previous.resetPass != current.resetPass,
            listener: (context, state) {
              if (state.resetPass.isSuccess) {
                toastAlert(
                  msg: 'Password Reseted Successfully',
                  color: AppColors.primaryColor,
                );
                context.pushNamedAndRemoveUntil(AppRoutes.signIn);
              } else if (state.resetPass.isError) {
                toastAlert(
                  msg: state.resetPass.error!,
                  color: AppColors.redColor,
                );
              }
            },
            builder: (context, state) => AppButton(
              text: state.resetPass.isLoading ? "Loading..." : "Reset Password",
              onPressed: () {
                if (cubit.resetPassFormKey.currentState!.validate()) {
                  if (cubit.passController.text ==
                      cubit.confirmPassController.text) {
                    cubit.forgotPassword();
                  } else {
                    toastAlert(
                      msg: "Password doesn't match",
                      color: AppColors.redColor,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
