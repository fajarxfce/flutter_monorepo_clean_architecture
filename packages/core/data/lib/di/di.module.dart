//@GeneratedMicroModule;DataPackageModule;package:data/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/di/data_module.dart' as _i202;
import 'package:data/src/local/auth_token_local_data_source.dart' as _i54;
import 'package:data/src/local/auth_token_local_data_source_impl.dart' as _i294;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final dataModule = _$DataModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => dataModule.secureStorage);
    gh.lazySingleton<_i54.AuthTokenLocalDataSource>(() =>
        _i294.AuthTokenLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
  }
}

class _$DataModule extends _i202.DataModule {}
