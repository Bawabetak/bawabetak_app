import 'package:bawabak/core/config/themes/app_colors.dart';
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

          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              ///hanle response
            },
            child: AppButton(
              text: "Reset Password",
              onPressed: cubit.state.resetPass.isLoading
                  ? null
                  : () {
                      if (cubit.resetPassFormKey.currentState!.validate()) {
                        ///call api
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}
