import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, Null>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<String, Null>> verifyEmail({
    required String email,
    required String code,
    required VerificationType type,
  });
  Future<Either<String, Null>> resendCode({
    required String email,
    required VerificationType type,
  });

  Future<Either<String, Null>> forgotPassword({
    required String email,
    required String password,
  });
}
