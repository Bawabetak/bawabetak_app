import 'package:bawabak/core/database/api/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.transformTimeout:
      throw ServerException(
        errorModel: ErrorModel(
          message:
              'Processing the server response took too long. Please try again.',
        ),
      );
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errorModel: ErrorModel(
          message: 'Please check your internet and try again.',
        ),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errorModel: ErrorModel(
          message: 'Sending request took too long. Please try again.',
        ),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorModel: ErrorModel(
          message: 'Server response timed out. Please try again later.',
        ),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errorModel: ErrorModel(
          message:
              'Security certificate issue detected. Please check your connection.',
        ),
      );

    case DioExceptionType.cancel:
      throw ServerException(
        errorModel: ErrorModel(
          message: 'Request was canceled before completion.',
        ),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(
          message:
              'Failed to connect to the server. Please check your internet connection.',
        ),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(
          message: 'An unexpected error occurred. Please try again later.',
        ),
      );

    //when request is done but the data is not matching to the expected one all codes between 400 to 500 are here:
    case DioExceptionType.badResponse:
      throw ServerException(
        errorModel: ErrorModel.fromJson(dioError.response!.data),
      );
  }
}
