import 'package:app/di/di.config.dart';
import 'package:app/router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in/di/di.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  $initGetIt(getIt);
  configureSignInDependencies(getIt);
}

@module
abstract class AppModule {
  @singleton
  AppRouter get appRouter;
}
