import 'dart:async';

import 'package:bawabak/core/helpers/box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailState.inintial());
  String otpCode = '';
  Timer? otpTimer;

  void enableVerifyButton() {
    if (otpCode.length == 4) {
      emit(state.copyWith(enableButton: true));
    } else {
      emit(state.copyWith(enableButton: false));
    }
  }

  void startTimer() {
    otpTimer?.cancel();
    otpTimer = Timer.periodic(Duration(seconds: 1), (time) {
      if (state.otpTime > 0) {
        emit(state.copyWith(otpTime: state.otpTime - 1));
      } else {
        resendCode();
      }
    });
  }

  void resendCode() {
    emit(state.copyWith(otpTime: 60));
    startTimer();

    ///call api
  }
}
