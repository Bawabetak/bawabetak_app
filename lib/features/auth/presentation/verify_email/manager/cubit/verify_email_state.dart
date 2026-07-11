part of 'verify_email_cubit.dart';

class VerifyEmailState {
  const VerifyEmailState({
    required this.otpTime,
    required this.enableButton,

    required this.verifyEmail,
  });
  final BoxState verifyEmail;
  final bool enableButton;
  final int otpTime;

  VerifyEmailState.inintial()
    : this(verifyEmail: BoxState.initial(), enableButton: false, otpTime: 60);

  VerifyEmailState copyWith({
    BoxState? verifyEmail,
    bool? enableButton,
    int? otpTime,
  }) {
    return VerifyEmailState(
      otpTime: otpTime ?? this.otpTime,
      verifyEmail: verifyEmail ?? this.verifyEmail,

      enableButton: enableButton ?? this.enableButton,
    );
  }
}
