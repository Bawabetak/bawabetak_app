part of 'forgot_password_cubit.dart';

class ForgotPasswordState {
  const ForgotPasswordState({required this.sendOtpCode});
  final BoxState sendOtpCode;

  ForgotPasswordState.inintial() : this(sendOtpCode: BoxState.initial());

  ForgotPasswordState copyWith({BoxState? sendOtpCode}) {
    return ForgotPasswordState(sendOtpCode: sendOtpCode ?? this.sendOtpCode);
  }
}
