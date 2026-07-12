part of 'sign_up_cubit.dart';

class SignUpState {
  const SignUpState({required this.showPassword, required this.signUp});
  final bool showPassword;
  final BoxState<void> signUp;

  SignUpState.inintial()
    : this(showPassword: false, signUp: BoxState.initial());

  SignUpState copyWith({bool? showPassword, BoxState? signUp}) {
    return SignUpState(
      showPassword: showPassword ?? this.showPassword,
      signUp: signUp ?? this.signUp,
    );
  }
}
