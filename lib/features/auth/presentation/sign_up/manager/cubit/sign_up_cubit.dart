import 'package:bawabak/core/helpers/box_state.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:bawabak/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpState.inintial());
  final signUpFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepo authRepo;

  void togglePasswordIcon() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (state.signUp.isLoading) return;

    emit(state.copyWith(signUp: BoxState.loading()));
    final response = await SignUpUseCase(
      authRepo: authRepo,
    ).call(email: emailController.text, password: passwordController.text);

    response.fold(
      (error) => emit(state.copyWith(signUp: BoxState.error(error: error))),
      (_) {
        emit(state.copyWith(signUp: BoxState.success()));
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
