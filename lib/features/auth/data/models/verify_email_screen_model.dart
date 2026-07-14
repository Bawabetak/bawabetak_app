import 'package:bawabak/core/enums/auth_enums.dart';

class VerifyEmailScreenModel {
  final String email;
  final String nextRoute;
  final bool fromSignUp;
  final VerificationType type;

  VerifyEmailScreenModel({
    required this.type,
    required this.fromSignUp,
    required this.email,
    required this.nextRoute,
  });
}
