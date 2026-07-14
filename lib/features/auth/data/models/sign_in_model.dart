import 'package:bawabak/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  const SignInModel({
    required super.accessToken,
    super.refreshToken,
    required super.isEmailVerified,
    required super.isApproved,
    required super.isCompleteRegistration,
  });

  factory SignInModel.fromJson({required Map<String, dynamic> json}) {
    return SignInModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      isEmailVerified: json['isEmailVerified'],
      isApproved: json['isApproved'],
      isCompleteRegistration: json['isCompleteRegistration'],
    );
  }
}
