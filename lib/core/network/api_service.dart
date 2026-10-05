import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response<dynamic>> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}