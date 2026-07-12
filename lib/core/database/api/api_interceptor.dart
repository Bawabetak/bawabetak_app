import 'dart:async';

import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/cache/secure_storage_helper.dart';
import 'package:bawabak/core/utils/app_strings.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final Future<void> Function()? onLogout;
  late final Dio _refreshDio;
  Completer<void>? _refreshCompleter;
  bool _isRefreshing = false;

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
    options.headers["X-Client-Type"] = "Mobile";

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      ///when other request is refershing the token
      if (_isRefreshing) {
        try {
          await _refreshCompleter!.future;
          return _retryRequest(err, handler);
        } catch (_) {
          return handler.next(err);
        }
      }

      ///when the current request is refreshing token
      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        final isRefreshedToken = await _refreshToken();

        if (isRefreshedToken) {
          _refreshCompleter!.complete();
          return _retryRequest(err, handler);
        } else {
          _refreshCompleter!.completeError(Exception("Refresh failed"));
          await onLogout?.call();
          return handler.next(err);
        }
      } finally {
        _isRefreshing = false;
        _refreshCompleter = null;
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
      final newRefreshToken = response.data["refreshToken"];
      SecureStorageHelper().set(
        key: AppStrings.accessToken,
        value: newAccessToken,
      );
      SecureStorageHelper().set(
        key: AppStrings.refreshToken,
        value: newRefreshToken,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
