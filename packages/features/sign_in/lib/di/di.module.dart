//@GeneratedMicroModule;SignInPackageModule;package:sign_in/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_domain/auth.dart' as _i60;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sign_in/src/presentation/bloc/sign_in_bloc.dart' as _i156;

class SignInPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i156.SignInBloc>(
        () => _i156.SignInBloc(gh<_i60.LoginWithEmailAndPasswordUsecase>()));
  }
}
