import 'package:network/src/config/dio_proxy_extension.dart';
import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:shared/shared.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    AuthInterceptor authInterceptor,
    @Named('BaseUrl') String baseUrl,
    @Named('IsProxy') bool isProxy,
    @Named('ProxyUrl') String proxyUrl,
  ) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(authInterceptor);

    // The DRY extension call
    dio.applyProxy(isProxy: isProxy, proxyUrl: proxyUrl);

    return dio;
  }
}
