import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});

  Future<Either<String, Null>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
