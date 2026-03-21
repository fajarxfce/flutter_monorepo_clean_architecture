// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared/shared.dart' as _i811;

import '../src/interceptor/auth_interceptor.dart' as _i285;
import 'network_module.dart' as _i567;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.singleton<_i285.AuthInterceptor>(() => _i285.AuthInterceptor());
  gh.lazySingleton<_i811.Dio>(
    () => networkModule.dio(gh<_i285.AuthInterceptor>()),
  );
  return getIt;
}

class _$NetworkModule extends _i567.NetworkModule {}
