import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/services/di/service_locator.dart';
import 'package:bawabak/features/auth/data/models/verify_email_screen_model.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/manager/cubit/forgot_password_cubit.dart';
import 'package:bawabak/features/auth/presentation/forgot_pass/screens/forgot_pass_screen.dart';
import 'package:bawabak/features/auth/presentation/sign_in/manager/cubit/sign_in_cubit.dart';
import 'package:bawabak/features/auth/presentation/sign_in/screens/sign_in_screen.dart';
import 'package:bawabak/features/auth/presentation/sign_up/manager/cubit/sign_up_cubit.dart';
import 'package:bawabak/features/auth/presentation/sign_up/screens/sign_up_screen.dart';
import 'package:bawabak/features/auth/presentation/verify_email/manager/cubit/verify_email_cubit.dart';
import 'package:bawabak/features/auth/presentation/verify_email/screens/verify_email_screen.dart';
import 'package:bawabak/features/onboarding/presentation/manager/cubit/onboarding_cubit.dart';
import 'package:bawabak/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => gi<OnboardingCubit>(),
            child: OnboardingScreen(),
          ),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => gi<SignInCubit>(),
            child: SignInScreen(),
          ),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => gi<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );
      case AppRoutes.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => gi<VerifyEmailCubit>()..startTimer(),
            child: VerifyEmailScreen(
              verifyEmailScreenModel: args as VerifyEmailScreenModel,
            ),
          ),
        );
      case AppRoutes.forgotPass:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => gi<ForgotPasswordCubit>(),
            child: ForgotPassScreen(email: args as String),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
