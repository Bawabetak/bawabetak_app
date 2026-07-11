import 'package:bawabak/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:get_it/get_it.dart';

final gi = GetIt.instance;

void setupServiceLocator() async {
  gi.registerLazySingleton(() => OnboardingCubit());
  gi.registerLazySingleton(() => SignInCubit());
}
