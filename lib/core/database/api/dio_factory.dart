import 'dart:convert';
import 'dart:developer';

import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/api/api_interceptor.dart';
import 'package:bawabak/core/functions/logout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class DioFactory {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(ApiInterceptor(client: dio, onLogout: logout));

    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            log("➡️ Sending request: ${options.uri}");
            log("Method: ${options.method}");
            log("Headers: ${options.headers}");

            if (options.data != null) {
              log("Body Type: ${options.data.runtimeType}");

              if (options.data is FormData) {
                final formData = options.data as FormData;
                log("Fields: ${formData.fields}");
                log("Files: ${formData.files.map((e) => e.key).toList()}");
              } else {
                try {
                  log("Body JSON: ${jsonEncode(options.data)}");
                } catch (_) {
                  log("Body: ${options.data}");
                }
              }
            }

            handler.next(options);
          },
          onResponse: (response, handler) {
            log("✅ Response: ${response.statusCode}");
            log("Response Headers: ${response.headers.map}");
            log("Response Data: ${response.data}");
            handler.next(response);
          },
          onError: (e, handler) {
            log("❌ Error: ${e.message}");

            if (e.response != null) {
              log("Status Code: ${e.response?.statusCode}");
              log("Response Headers: ${e.response?.headers.map}");
              log("Response Data: ${e.response?.data}");
            }

            handler.next(e);
          },
        ),
      );
    }

    return dio;
  }
}
