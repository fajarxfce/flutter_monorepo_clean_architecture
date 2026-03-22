import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:shared/shared.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor, @Named('BaseUrl') String baseUrl) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
