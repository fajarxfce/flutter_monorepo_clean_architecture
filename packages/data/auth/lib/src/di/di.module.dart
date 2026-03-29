//@GeneratedMicroModule;AuthDataPackageModule;package:auth_data/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_data/src/di/di.dart' as _i895;
import 'package:auth_data/src/repository/auth_repository_impl.dart' as _i522;
import 'package:auth_data/src/source/auth_api_service.dart' as _i581;
import 'package:auth_data/src/source/auth_remote_datasource.dart' as _i778;
import 'package:auth_data/src/source/auth_remote_datasource_impl.dart' as _i73;
import 'package:auth_domain/auth.dart' as _i60;
import 'package:data/data.dart' as _i437;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;

class AuthDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final authDataModule = _$AuthDataModule();
    gh.singleton<_i581.AuthApiService>(
        () => authDataModule.provideAuthApiService(gh<_i811.Dio>()));
    gh.singleton<_i778.AuthRemoteDatasource>(
        () => _i73.AuthRemoteDatasourceImpl(gh<_i581.AuthApiService>()));
    gh.singleton<_i60.AuthRepository>(() => _i522.AuthRepositoryImpl(
          gh<_i778.AuthRemoteDatasource>(),
          gh<_i437.AuthTokenLocalDataSource>(),
        ));
  }
}

class _$AuthDataModule extends _i895.AuthDataModule {}
