import 'package:bawabak/core/database/api/api_end_points.dart';
import 'package:bawabak/core/database/api/api_interceptor.dart';
import 'package:bawabak/core/database/api/api_service.dart';
import 'package:bawabak/core/database/api/errors/api_exception.dart';
import 'package:bawabak/core/database/api/errors/error_model.dart';
import 'package:bawabak/core/functions/logout.dart';
import 'package:dio/dio.dart';

class DioService implements ApiService {
  final Dio dio;

  DioService({required this.dio}) {
    dio.options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );

    dio.interceptors.add(ApiInterceptor(client: dio, onLogout: logout));
    // dio.interceptors.add(LogInterceptor());
  }
  @override
  Future get(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.put(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.patch(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(message: e.toString()));
    }
  }

  @override
  Future delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    } catch (e) {
      throw ServerException(errorModel: ErrorModel(message: e.toString()));
    }
  }
}
