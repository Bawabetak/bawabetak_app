import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class VerifyEmail {
  final AuthRepo authRepo;

  VerifyEmail({required this.authRepo});

  Future<Either<String, Null>> call({
    required String email,
    required String code,
    required VerificationType type,
  }) async {
    return await authRepo.verifyEmail(email: email, code: code, type: type);
  }
}
