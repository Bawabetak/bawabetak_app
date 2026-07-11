import 'package:bawabak/core/helpers/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState.inintial());

  final forgotPassFormKey = GlobalKey<FormState>();
  final resetPassFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void togglePasswordIcon() {
    emit(state.copyWith(showPass: !state.showPass));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    return super.close();
  }
}
