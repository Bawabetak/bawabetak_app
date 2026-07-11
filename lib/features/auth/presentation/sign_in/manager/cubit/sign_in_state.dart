part of 'sign_in_cubit.dart';

class SignInState {
  const SignInState({required this.showPassword, required this.singIn});
  final bool showPassword;
  final BoxState singIn;

  SignInState.inintial()
    : this(showPassword: false, singIn: BoxState.initial());

  SignInState copyWith({bool? showPassword, BoxState? singIn}) {
    return SignInState(
      showPassword: showPassword ?? this.showPassword,
      singIn: singIn ?? this.singIn,
    );
  }
}
