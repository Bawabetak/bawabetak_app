import 'package:bawabak/core/config/routing/app_routes.dart';
import 'package:bawabak/core/database/cache/secure_storage_helper.dart';
import 'package:bawabak/core/services/di/service_locator.dart';

Future<void> logout() async {
  await Future.wait([
    SecureStorageHelper().clear(),

    ///remove other keys
  ]);

  navigatorKey.currentState?.pushNamedAndRemoveUntil(
    AppRoutes.signIn,
    (route) => false,
  );
}
