// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth_domain/auth.dart' as _i60;
import 'package:data/data.dart' as _i437;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;

import '../repository/auth_repository_impl.dart' as _i180;
import '../source/auth_api_service.dart' as _i385;
import '../source/auth_remote_datasource.dart' as _i539;
import '../source/auth_remote_datasource_impl.dart' as _i454;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final authDataModule = _$AuthDataModule();
  gh.singleton<_i385.AuthApiService>(
    () => authDataModule.provideAuthApiService(gh<_i811.Dio>()),
  );
  gh.singleton<_i539.AuthRemoteDatasource>(
    () => _i454.AuthRemoteDatasourceImpl(gh<_i385.AuthApiService>()),
  );
  gh.singleton<_i60.AuthRepository>(
    () => _i180.AuthRepositoryImpl(
      gh<_i539.AuthRemoteDatasource>(),
      gh<_i437.AuthTokenLocalDataSource>(),
    ),
  );
  return getIt;
}

class _$AuthDataModule extends _i913.AuthDataModule {}
