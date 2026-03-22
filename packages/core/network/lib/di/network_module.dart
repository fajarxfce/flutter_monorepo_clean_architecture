import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:shared/shared.dart';

class EnvConfig {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://192.168.1.39:3000',
  );
}

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(BaseOptions(baseUrl: EnvConfig.baseUrl));
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
