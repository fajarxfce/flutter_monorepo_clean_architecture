//@GeneratedMicroModule;AuthDomainPackageModule;package:auth_domain/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth_domain/auth.dart' as _i60;
import 'package:auth_domain/src/usecase/login_with_email_and_password_usecase.dart'
    as _i350;
import 'package:injectable/injectable.dart' as _i526;

class AuthDomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i350.LoginWithEmailAndPasswordUsecase>(() =>
        _i350.LoginWithEmailAndPasswordUsecase(gh<_i60.AuthRepository>()));
  }
}
