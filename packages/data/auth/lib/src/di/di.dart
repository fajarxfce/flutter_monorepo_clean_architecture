import 'package:auth_data/src/source/auth_api_service.dart';
import 'package:shared/shared.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureAuthDataDependencies(GetIt getIt) => init(getIt);

@module
abstract class AuthDataModule {
  @singleton
  AuthApiService provideAuthApiService(Dio dio) => AuthApiService(dio);
}
