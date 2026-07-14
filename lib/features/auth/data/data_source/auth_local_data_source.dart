import 'package:bawabak/core/database/cache/secure_storage_helper.dart';
import 'package:bawabak/core/utils/app_strings.dart';
import 'package:bawabak/features/auth/domain/entities/sign_in_entity.dart';

class AuthLocalDataSource {
  Future<void> saveUserSession({required SignInEntity session}) async {
    await Future.wait([
      if (session.accessToken.isNotEmpty)
        SecureStorageHelper().set(
          key: AppStrings.accessToken,
          value: session.accessToken,
        ),
      if (session.refreshToken != null || session.refreshToken!.isNotEmpty)
        SecureStorageHelper().set(
          key: AppStrings.refreshToken,
          value: session.refreshToken!,
        ),
    ]);
  }
}
