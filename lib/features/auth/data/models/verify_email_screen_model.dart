class VerifyEmailScreenModel {
  final String email;
  final String nextRoute;
  final bool fromSignUp;

  VerifyEmailScreenModel({
    required this.fromSignUp,
    required this.email,
    required this.nextRoute,
  });
}
