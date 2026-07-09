import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => Container());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
