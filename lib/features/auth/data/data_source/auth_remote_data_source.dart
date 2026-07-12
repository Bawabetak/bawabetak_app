import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/api/api_service.dart';

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
}
