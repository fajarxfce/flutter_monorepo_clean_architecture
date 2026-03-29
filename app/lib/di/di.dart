import 'package:app/di/di.config.dart';
import 'package:app/router/app_router.dart';
import 'package:app/router/auth_guard.dart';
import 'package:auth_data/auth.dart';
import 'package:data/data.dart';
import 'package:auth_domain/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:app/flavors.dart';
import 'package:data/di/di.module.dart';
import 'package:network/di/di.module.dart';
import 'package:notifications/src/di/di.module.dart';
import 'package:auth_data/src/di/di.module.dart';
import 'package:auth_domain/src/di/di.module.dart';
import 'package:sign_in/di/di.module.dart';
import 'package:splash/di/di.module.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
    ExternalModule(NotificationsPackageModule),
    ExternalModule(SplashPackageModule),
  ],
  externalPackageModulesAfter: [
    ExternalModule(NetworkPackageModule),
    ExternalModule(AuthDataPackageModule),
    ExternalModule(AuthDomainPackageModule),
    ExternalModule(SignInPackageModule),
  ],
)
Future<void> configureDependencies() async {
  await $initGetIt(getIt);
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
