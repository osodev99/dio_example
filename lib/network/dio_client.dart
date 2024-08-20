import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final client = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(seconds: 1),
      sendTimeout: const Duration(seconds: 1),
      receiveTimeout: const Duration(seconds: 1),
    ),
  )..interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            if (options.path != '/login' && options.path != '/register') {
              const token = 'El token viene aqui';
              options.headers.addAll({'Authorization': 'Bearer $token'});
            }
            handler.next(options);
          },
        ),
        if (kDebugMode)
          LogInterceptor(
            request: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: false,
          ),
      ],
    );
}
