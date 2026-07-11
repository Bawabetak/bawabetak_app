part of 'forgot_password_cubit.dart';

class ForgotPasswordState {
  const ForgotPasswordState({
    required this.sendOtpCode,
    required this.showPass,
    required this.resetPass,
  });
  final BoxState sendOtpCode;
  final BoxState resetPass;
  final bool showPass;

  ForgotPasswordState.inintial()
    : this(
        sendOtpCode: BoxState.initial(),
        showPass: false,
        resetPass: BoxState.initial(),
      );

  ForgotPasswordState copyWith({
    BoxState? sendOtpCode,
    bool? showPass,
    BoxState? resetPass,
  }) {
    return ForgotPasswordState(
      resetPass: resetPass ?? this.resetPass,
      sendOtpCode: sendOtpCode ?? this.sendOtpCode,
      showPass: showPass ?? this.showPass,
    );
  }
}
