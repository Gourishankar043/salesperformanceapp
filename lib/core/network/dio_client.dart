import 'package:dio/dio.dart';

import '../config/environment.dart';
import 'api_interceptor.dart';

class DioClient {
  DioClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: EnvironmentConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ) {
    dio.interceptors.add(ApiInterceptor());
  }

  final Dio dio;
}