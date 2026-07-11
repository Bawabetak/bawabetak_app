import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/manager/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassForm extends StatelessWidget {
  const ForgotPassForm({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Form(
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            hint: "Email Address",
            prefixIcon: Icon(Icons.email, color: AppColors.grey, size: 23),
          ),

          const VerticalSpace(35),
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listenWhen: (previous, current) =>
                previous.sendOtpCode != current.sendOtpCode,
            listener: (context, state) {
              //listen to api response
            },
            child: AppButton(
              text: "Send Verification Code",
              onPressed: cubit.state.sendOtpCode.isLoading
                  ? null
                  : () {
                      if (cubit.formKey.currentState!.validate()) {}
                    },
            ),
          ),
        ],
      ),
    );
  }
}
