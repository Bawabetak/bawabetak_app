part of 'sign_up_cubit.dart';

class SignUpState {
  const SignUpState({required this.showPassword, required this.singIn});
  final bool showPassword;
  final BoxState singIn;

  SignUpState.inintial()
    : this(showPassword: false, singIn: BoxState.initial());

  SignUpState copyWith({bool? showPassword, BoxState? singIn}) {
    return SignUpState(
      showPassword: showPassword ?? this.showPassword,
      singIn: singIn ?? this.singIn,
    );
  }
}
