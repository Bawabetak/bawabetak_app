import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/cache/secure_storage_helper.dart';
import 'package:bawabak/core/utils/app_strings.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final Future<void> Function()? onLogout;
  late final Dio _refreshDio;

  ApiInterceptor({required this.onLogout, required this.client}) {
    _refreshDio = Dio();
    _refreshDio.options.baseUrl = ApiEndPoints.baseUrl;
  }
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken = await SecureStorageHelper().get(
      key: AppStrings.accessToken,
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final isRefreshedToken = await _refreshToken();

      if (isRefreshedToken) {
        return _retryRequest(err, handler);
      } else {
        await onLogout?.call();
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  Future<void> _retryRequest(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final String? newAccessToken = await SecureStorageHelper().get(
      key: AppStrings.accessToken,
    );
    err.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

    final response = await client.fetch(err.requestOptions);
    return handler.resolve(response);
  }

  Future<bool> _refreshToken() async {
    try {
      final String? refreshToken = await SecureStorageHelper().get(
        key: AppStrings.refreshToken,
      );
      if (refreshToken == null || refreshToken.isEmpty) return false;

      final response = await _refreshDio.post(
        ApiEndPoints.refreshToken,
        data: {"refreshToken": refreshToken},
        options: Options(headers: {"X-Client-Type": "Mobile"}),
      );

      final newAccessToken = response.data["accessToken"];
      await SecureStorageHelper().set(
        key: AppStrings.accessToken,
        value: newAccessToken,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
