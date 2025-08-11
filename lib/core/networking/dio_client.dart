import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../env/env_config.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: EnvConfig.apiBaseUrl,
      headers: {'X-API-Key': EnvConfig.publicApiKey},
    ),
  );

  dio.interceptors.addAll([
    AuthTokenInterceptor(),
    RetryOnSocketException(),
    if (EnvConfig.isDevelopment) LogInterceptor(responseBody: true),
  ]);

  return dio;
});

class AuthTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: Get Firebase ID token and add to header
    // final user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   final token = await user.getIdToken();
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }
}

class RetryOnSocketException extends Interceptor {
  static const _maxRetries = 3;
  static const _retryDelays = [500, 1000, 2000]; // milliseconds

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      RequestOptions request = err.requestOptions;
      int retryCount = request.extra['retryCount'] ?? 0;

      if (retryCount < _maxRetries) {
        request.extra['retryCount'] = retryCount + 1;
        await Future.delayed(Duration(milliseconds: _retryDelays[retryCount]));
        return handler.resolve(await Dio().fetch(request));
      }
    }
    return handler.next(err);
  }
}