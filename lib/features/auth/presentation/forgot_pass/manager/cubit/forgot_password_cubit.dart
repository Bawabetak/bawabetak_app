import 'package:bawabak/core/helpers/box_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState.inintial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
