import 'package:bawabak/core/database/api/errors/api_exception.dart';
import 'package:bawabak/core/enums/auth_enums.dart';
import 'package:bawabak/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:bawabak/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:bawabak/features/auth/domain/entities/sign_in_entity.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  ///here we check internet and then specify data sourece
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<String, Null>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await remote.signUpWithEmailAndPassword(email: email, password: password);
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> resendCode({
    required String email,
    required VerificationType type,
  }) async {
    try {
      await remote.resendCode(email: email, type: type);
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> verifyEmail({
    required String email,
    required String code,
    required VerificationType type,
  }) async {
    try {
      await remote.verifyEmail(email: email, code: code, type: type);
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> forgotPassword({
    required String email,
    required String password,
  }) async {
    try {
      await remote.forgotPassword(email: email, password: password);
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SignInEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remote.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await local.saveUserSession(session: result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
