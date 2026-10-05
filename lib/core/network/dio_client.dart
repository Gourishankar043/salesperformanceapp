import 'package:dio/dio.dart';

import '../config/environment.dart';

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
  );

  final Dio dio;
}