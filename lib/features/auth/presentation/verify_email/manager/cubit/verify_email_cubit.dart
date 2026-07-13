import 'dart:async';

import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/core/helpers/box_state.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:bawabak/features/auth/domain/use_cases/resend_code.dart';
import 'package:bawabak/features/auth/domain/use_cases/verify_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailState.inintial());
  String otpCode = '';
  Timer? otpTimer;

  final AuthRepo authRepo;

  void enableVerifyButton() {
    if (otpCode.length == 6) {
      emit(state.copyWith(enableButton: true));
    } else {
      emit(state.copyWith(enableButton: false));
    }
  }

  void startTimer({required String email, required VerificationType type}) {
    otpTimer?.cancel();
    otpTimer = Timer.periodic(Duration(seconds: 1), (time) {
      if (state.otpTime > 0) {
        emit(state.copyWith(otpTime: state.otpTime - 1));
      } else {
        resendCode(email: email, type: type);
      }
    });
  }

  void resendCode({
    required String email,
    required VerificationType type,
  }) async {
    await resendOtpCodeToEmail(email: email, type: type);
    emit(state.copyWith(otpTime: 60));
    startTimer(email: email, type: type);
  }

  Future<void> verifyCode({required String email}) async {
    if (state.verifyEmail.isLoading || otpCode.length < 6) return;
    emit(state.copyWith(verifyEmail: BoxState.loading()));
    final response = await VerifyEmail(
      authRepo: authRepo,
    ).call(email: email, code: otpCode, type: VerificationType.otp);

    response.fold(
      (error) {
        emit(state.copyWith(verifyEmail: BoxState.error(error: error)));
      },
      (_) {
        otpTimer?.cancel();
        emit(state.copyWith(verifyEmail: BoxState.success()));
      },
    );
  }

  Future<void> resendOtpCodeToEmail({
    required String email,
    required VerificationType type,
  }) async {
    final response = await ResendCode(
      authRepo: authRepo,
    ).call(email: email, type: type);

    response.fold((error) {
      otpTimer?.cancel();
      emit(state.copyWith(verifyEmail: BoxState.error(error: error)));
    }, (_) {});
  }
}
