import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_example/network/error_request.dart';

class DioClientException {
  late ErrorRequest error;

  DioClientException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.receiveTimeout:
        error = TimeoutError(path: dioError.requestOptions.path);
        break;
      case DioExceptionType.connectionTimeout:
        // error = 'Se ha agotado el tiempo de conexión.';
        error = TimeoutError(path: dioError.requestOptions.path);
        break;
      case DioExceptionType.badResponse:
        error = _errorStatusCode(dioError);
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          // error = 'No tienes conexión a internet.';
          error = NetworkError();
          break;
        }
        error = ServerError(
          statusCode: dioError.response?.statusCode,
          path: dioError.requestOptions.path,
          cause: dioError.message,
        );
        break;
      default:
        error = ServerError(
          statusCode: dioError.response?.statusCode,
          path: dioError.requestOptions.path,
          cause: dioError.message,
        );
        break;
    }
  }

  ErrorRequest _errorStatusCode(DioException dioError) {
    return TimeoutError(path: dioError.requestOptions.path);
  }
}
