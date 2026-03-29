//@GeneratedMicroModule;NetworkPackageModule;package:network/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/data.dart' as _i437;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/di/network_module.dart' as _i191;
import 'package:network/src/interceptor/auth_interceptor.dart' as _i114;
import 'package:shared/shared.dart' as _i811;

class NetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.singleton<_i114.AuthInterceptor>(
        () => _i114.AuthInterceptor(gh<_i437.AuthTokenLocalDataSource>()));
    gh.lazySingleton<_i811.Dio>(() => networkModule.dio(
          gh<_i114.AuthInterceptor>(),
          gh<String>(instanceName: 'BaseUrl'),
        ));
  }
}

class _$NetworkModule extends _i191.NetworkModule {}
