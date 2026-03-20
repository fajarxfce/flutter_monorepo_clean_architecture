import 'package:shared/shared.dart';

@singleton
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = 'your_auth_token'; // from secure storage
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      final refreshToken = 'your_refresh_token';
      if (refreshToken.isNotEmpty) {
      } else {}
    }
    handler.next(err);
  }
}
