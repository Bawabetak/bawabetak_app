import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ForgotPassword {
  final AuthRepo authRepo;

  ForgotPassword({required this.authRepo});

  Future<Either<String, Null>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.forgotPassword(email: email, password: password);
  }
}
