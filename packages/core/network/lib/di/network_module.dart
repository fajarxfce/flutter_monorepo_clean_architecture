import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:shared/shared.dart';

const String baseUrl = 'http://192.168.1.39:3000';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
