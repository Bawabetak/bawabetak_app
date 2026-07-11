import 'package:bawabak/core/config/themes/app_colors.dart';
import 'package:bawabak/core/extensions/config_extenstions.dart';
import 'package:bawabak/core/utils/app_spaces.dart';
import 'package:bawabak/core/widgets/app_button.dart';
import 'package:bawabak/core/widgets/app_text_form_field.dart';
import 'package:bawabak/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    final cubit = context.read<SignInCubit>();
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.signInFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hint: "Email",
            prefixIcon: Icon(Icons.email, color: AppColors.grey, size: 23),
          ),
          const VerticalSpace(18),
          BlocBuilder<SignInCubit, SignInState>(
            buildWhen: (previous, current) =>
                previous.showPassword != current.showPassword,
            builder: (context, state) {
              return AppTextFormField(
                controller: passwordController,
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
            child: Text(
              'Forgot the password?',
              style: context.textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const VerticalSpace(13),

          AppButton(
            text: "Sign In",
            onPressed: () {
              if (cubit.signInFormKey.currentState!.validate()) {
                ///call api
              }
            },
          ),
        ],
      ),
    );
  }
}
