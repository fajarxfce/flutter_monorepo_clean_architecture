import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:shared/shared.dart';

abstract class NetworkModule {
  static const String baseUrl = 'https://api.example.com';

  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
