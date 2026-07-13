import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ResendCode {
  final AuthRepo authRepo;

  ResendCode({required this.authRepo});

  Future<Either<String, Null>> call({
    required String email,
    required VerificationType type,
  }) async {
    return await authRepo.resendCode(email: email, type: type);
  }
}
