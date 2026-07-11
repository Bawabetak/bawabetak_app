import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/services/di/service_locator.dart';
import 'package:bawabak/features/auth/presentation/sign_in/screens/sign_in_screen.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => gi<OnboardingCubit>(),
            child: OnboardingScreen(),
          ),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
