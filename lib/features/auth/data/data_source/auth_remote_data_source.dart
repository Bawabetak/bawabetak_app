import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/api/api_service.dart';
import 'package:bawabak/core/enums/auth_enums.dart';

class AuthRemoteDataSource {
  final ApiService api;

  AuthRemoteDataSource({required this.api});

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await api.post(
      ApiEndPoints.register,
      body: {"Email": email, "Password": password},
    );
  }

  Future<void> verifyEmail({
    required String email,
    required String code,
    required VerificationType type,
  }) async {
    await api.post(
      ApiEndPoints.verifyCode,
      body: {"email": email, "code": code, "type": type.index},
    );
  }

  Future<void> resendCode({
    required String email,
    required VerificationType type,
  }) async {
    await api.post(
      ApiEndPoints.sendVerificationCode,
      body: {"email": email, "type": type.index},
    );
  }

  Future<void> forgotPassword({
    required String email,
    required String password,
  }) async {
    await api.post(
      ApiEndPoints.forgotPassword,
      body: {"email": email, "password": password},
    );
  }
}
