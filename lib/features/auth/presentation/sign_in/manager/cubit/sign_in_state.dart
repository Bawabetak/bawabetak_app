part of 'sign_in_cubit.dart';

class SignInState {
  const SignInState({
    required this.sendOtpCode,
    required this.showPassword,
    required this.signIn,
  });
  final bool showPassword;
  final BoxState<SignInEntity> signIn;
  final BoxState<void> sendOtpCode;

  SignInState.inintial()
    : this(
        showPassword: false,
        signIn: BoxState.initial(),
        sendOtpCode: BoxState.initial(),
      );

  SignInState copyWith({
    bool? showPassword,
    BoxState<SignInEntity>? signIn,
    BoxState<void>? sendOtpCode,
  }) {
    return SignInState(
      showPassword: showPassword ?? this.showPassword,
      signIn: signIn ?? this.signIn,
      sendOtpCode: sendOtpCode ?? this.sendOtpCode,
    );
  }
}
