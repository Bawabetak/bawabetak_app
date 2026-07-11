import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/database/cache/shared_preferences_helper.dart';
import 'package:bawabak/core/utils/app_strings.dart';

String handleInitialRoute() {
  final bool? isVisitedOnboarding =
      SharedPreferencesHelper().get(key: AppStrings.isVisitedOnboarding)
          as bool?;
  if (isVisitedOnboarding == true) {
    return AppRoutes.signIn;
  } else {
    return AppRoutes.onboarding;
  }
}
