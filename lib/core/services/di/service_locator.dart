import 'package:bawabak/core/database/api/dio_factory.dart';
import 'package:bawabak/core/database/api/dio_service.dart';
import 'package:bawabak/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:bawabak/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bawabak/features/auth/domain/repo/auth_repo.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/manager/cubit/forgot_password_cubit.dart';
import 'package:bawabak/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:bawabak/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:bawabak/features/auth/presentation/verify_email/manager/cubit/verify_email_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final gi = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void setupServiceLocator() async {
  final dio = DioFactory.createDio();
  gi.registerLazySingleton(() => DioService(dio: dio));
  gi.registerLazySingleton(() => AuthRemoteDataSource(api: gi<DioService>()));
  gi.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(remote: gi<AuthRemoteDataSource>()),
  );

  ///all cubits
  gi.registerLazySingleton(() => OnboardingCubit());
  gi.registerFactory(() => SignInCubit());
  gi.registerFactory(() => SignUpCubit(gi<AuthRepo>()));
  gi.registerFactory(() => VerifyEmailCubit());
  gi.registerFactory(() => ForgotPasswordCubit());
}
