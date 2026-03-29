//@GeneratedMicroModule;SplashPackageModule;package:splash/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/data.dart' as _i437;
import 'package:injectable/injectable.dart' as _i526;
import 'package:splash/src/presentation/bloc/splash_bloc.dart' as _i862;

class SplashPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i862.SplashBloc>(
        () => _i862.SplashBloc(gh<_i437.AuthTokenLocalDataSource>()));
  }
}
