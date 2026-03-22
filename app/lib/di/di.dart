import 'package:app/di/di.config.dart';
import 'package:app/router/app_router.dart';
import 'package:app/router/auth_guard.dart';
import 'package:auth_data/auth.dart';
import 'package:data/data.dart';
import 'package:auth_domain/auth.dart';
import 'package:app/flavors.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/di/di.dart';
import 'package:sign_in/di/di.dart';
import 'package:splash/splash.dart';

import 'package:notifications/notifications.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  configureDataModule(getIt);
  $initGetIt(getIt);
  configureNetworkModule(getIt);
  configureAuthDataDependencies(getIt);
  configureAuthDomainDependencies(getIt);
  configureSignInDependencies(getIt);
  configureSplashDependencies(getIt);
  configureNotificationDependencies(getIt);
}

@module
abstract class AppModule {
  @singleton
  AuthGuard get authGuard => AuthGuard(getIt<AuthTokenLocalDataSource>());

  @singleton
  AppRouter appRouter(AuthGuard authGuard) => AppRouter(authGuard: authGuard);

  @Named('BaseUrl')
  String get baseUrl => F.baseUrl;
}
