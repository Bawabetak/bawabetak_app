class SignInEntity {
  final String accessToken;
  final String? refreshToken;
  final bool isEmailVerified;
  final bool isApproved;
  final bool isCompleteRegistration;

  const SignInEntity({
    required this.accessToken,
    this.refreshToken,
    required this.isEmailVerified,
    required this.isApproved,
    required this.isCompleteRegistration,
  });
}
