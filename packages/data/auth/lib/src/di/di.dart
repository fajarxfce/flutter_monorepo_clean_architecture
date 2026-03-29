import 'package:auth_data/src/source/auth_api_service.dart';
import 'package:shared/shared.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class AuthDataModule {
  @singleton
  AuthApiService provideAuthApiService(Dio dio) => AuthApiService(dio);
}
