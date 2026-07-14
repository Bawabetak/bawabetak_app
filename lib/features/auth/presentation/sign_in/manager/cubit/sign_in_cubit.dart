import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/core/helpers/box_state.dart';
import 'package:bawabak/features/auth/domain/entities/sign_in_entity.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:bawabak/features/auth/domain/use_cases/resend_code.dart';
import 'package:bawabak/features/auth/domain/use_cases/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInState.inintial());

  final AuthRepo authRepo;

  final signInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordIcon() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> signInWithEmailAndPassword() async {
    if (state.signIn.isLoading || state.sendOtpCode.isLoading) return;
    emit(state.copyWith(signIn: BoxState.loading()));
    final result = await SignIn(
      authRepo: authRepo,
    ).call(email: emailController.text, password: passwordController.text);

    result.fold(
      (error) => emit(state.copyWith(signIn: BoxState.error(error: error))),

      (success) async {
        emit(state.copyWith(signIn: BoxState.success(data: success)));
      },
    );
  }

  Future<void> resendOtpCodeToEmail() async {
    if (state.sendOtpCode.isLoading) return;
    // Consume sign-in success to avoid re-triggering listener
    emit(
      state.copyWith(
        signIn: BoxState.initial(),
        sendOtpCode: BoxState.loading(),
      ),
    );
    final response = await ResendCode(
      authRepo: authRepo,
    ).call(email: emailController.text, type: VerificationType.otp);

    response.fold(
      (error) {
        emit(state.copyWith(sendOtpCode: BoxState.error(error: error)));
      },
      (_) {
        emit(state.copyWith(sendOtpCode: BoxState.success()));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
