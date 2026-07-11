import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:get_it/get_it.dart';

final gi = GetIt.instance;

void setupServiceLocator() async {
  gi.registerFactory(() => OnboardingCubit());
}
