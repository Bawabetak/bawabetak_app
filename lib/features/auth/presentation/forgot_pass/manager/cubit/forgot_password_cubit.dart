import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/core/helpers/box_state.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:bawabak/features/auth/domain/use_cases/forgot_password.dart';
import 'package:bawabak/features/auth/domain/use_cases/resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordState.inintial());

  final AuthRepo authRepo;

  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void togglePasswordIcon() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  Future<void> resendOtpCodeToEmail() async {
    if (state.sendOtpCode.isLoading) return;
    emit(state.copyWith(sendOtpCode: BoxState.loading()));
    final response = await ResendCode(
      authRepo: authRepo,
    ).call(email: emailController.text, type: VerificationType.forgotPassword);

    response.fold(
      (error) {
        emit(state.copyWith(sendOtpCode: BoxState.error(error: error)));
      },
      (_) {
        emit(state.copyWith(sendOtpCode: BoxState.success()));
      },
    );
  }

  Future<void> forgotPassword() async {
    if (state.resetPass.isLoading) return;
    emit(state.copyWith(resetPass: BoxState.loading()));
    final response = await ForgotPassword(
      authRepo: authRepo,
    ).call(email: emailController.text, password: passController.text);

    response.fold(
      (error) {
        emit(state.copyWith(resetPass: BoxState.error(error: error)));
      },
      (_) {
        emit(state.copyWith(resetPass: BoxState.success()));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    return super.close();
  }
}
