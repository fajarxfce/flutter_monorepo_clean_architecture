import 'package:data/data.dart';
import 'package:shared/shared.dart';

@singleton
class AuthInterceptor extends Interceptor {
  final AuthTokenLocalDataSource _tokenDataSource;

  AuthInterceptor(this._tokenDataSource);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenDataSource.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle refresh token logic later here
      final refreshToken = 'your_refresh_token';
      if (refreshToken.isNotEmpty) {
      } else {}
    }
    handler.next(err);
  }
}
