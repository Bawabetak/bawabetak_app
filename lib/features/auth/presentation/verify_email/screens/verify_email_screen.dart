import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/constants/app_sizes.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/features/auth/data/models/verify_email_screen_model.dart';
import 'package:bawabak/features/auth/presentation/verify_email/manager/cubit/verify_email_cubit.dart';
import 'package:bawabak/features/auth/presentation/verify_email/widgets/custom_otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.verifyEmailScreenModel});

  final VerifyEmailScreenModel verifyEmailScreenModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verification Code")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
            child: Column(
              children: [
                const VerticalSpace(25),
                Text(
                  "A verification code has been sent to your email",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const VerticalSpace(20),
                const CustomOtpField(),
                const VerticalSpace(20),
                BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
                  buildWhen: (previous, current) =>
                      previous.otpTime != current.otpTime,
                  builder: (context, state) {
                    return Text(
                      "Resend Code in ${state.otpTime}s",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    );
                  },
                ),

                const VerticalSpace(15),
                BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
                  listenWhen: (previous, current) =>
                      previous.enableButton != current.enableButton,
                  buildWhen: (previous, current) =>
                      previous.enableButton != current.enableButton,
                  listener: (context, state) {
                    ///when api response
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: "Verify",
                      color: state.enableButton
                          ? AppColors.primaryColor
                          : AppColors.grey,

                      onPressed: state.verifyEmail.isLoading
                          ? null
                          : () {
                              ///call api
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
