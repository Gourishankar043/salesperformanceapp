import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    print(
      'API REQUEST: ${options.method} ${options.uri}',
    );

    handler.next(options);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    print(
      'API RESPONSE: ${response.statusCode} ${response.requestOptions.uri}',
    );

    handler.next(response);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    print(
      'API ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}',
    );

    print(
      'API ERROR MESSAGE: ${err.message}',
    );

    handler.next(err);
  }
}