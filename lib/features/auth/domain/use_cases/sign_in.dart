import 'package:bawabak/features/auth/domain/entities/sign_in_entity.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final AuthRepo authRepo;

  SignIn({required this.authRepo});

  Future<Either<String, SignInEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
