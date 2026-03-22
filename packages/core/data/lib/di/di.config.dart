// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../src/local/auth_token_local_data_source.dart' as _i886;
import '../src/local/auth_token_local_data_source_impl.dart' as _i851;
import 'data_module.dart' as _i444;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final dataModule = _$DataModule();
  gh.lazySingleton<_i558.FlutterSecureStorage>(() => dataModule.secureStorage);
  gh.lazySingleton<_i886.AuthTokenLocalDataSource>(
    () => _i851.AuthTokenLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
  );
  return getIt;
}

class _$DataModule extends _i444.DataModule {}
