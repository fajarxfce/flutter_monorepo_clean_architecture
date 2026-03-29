// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_data/src/di/di.module.dart' as _i383;
import 'package:auth_domain/src/di/di.module.dart' as _i39;
import 'package:data/di/di.module.dart' as _i220;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/di/di.module.dart' as _i1017;
import 'package:notifications/src/di/di.module.dart' as _i129;
import 'package:sign_in/di/di.module.dart' as _i890;
import 'package:splash/di/di.module.dart' as _i53;

import '../router/app_router.dart' as _i81;
import '../router/auth_guard.dart' as _i313;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  await _i220.DataPackageModule().init(gh);
  await _i129.NotificationsPackageModule().init(gh);
  await _i53.SplashPackageModule().init(gh);
  final appModule = _$AppModule();
  gh.singleton<_i313.AuthGuard>(() => appModule.authGuard);
  gh.factory<String>(() => appModule.baseUrl, instanceName: 'BaseUrl');
  gh.singleton<_i81.AppRouter>(
    () => appModule.appRouter(gh<_i313.AuthGuard>()),
  );
  await _i1017.NetworkPackageModule().init(gh);
  await _i383.AuthDataPackageModule().init(gh);
  await _i39.AuthDomainPackageModule().init(gh);
  await _i890.SignInPackageModule().init(gh);
  return getIt;
}

class _$AppModule extends _i913.AppModule {}
