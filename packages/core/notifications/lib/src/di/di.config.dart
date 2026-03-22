// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/fcm_notification_service_impl.dart' as _i927;
import '../domain/notification_service.dart' as _i20;
import 'notification_module.dart' as _i288;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final notificationModule = _$NotificationModule();
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => notificationModule.firebaseMessaging,
    );
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
      () => notificationModule.flutterLocalNotificationsPlugin,
    );
    gh.lazySingleton<_i20.NotificationService>(
      () => _i927.FcmNotificationServiceImpl(
        gh<_i892.FirebaseMessaging>(),
        gh<_i163.FlutterLocalNotificationsPlugin>(),
      ),
    );
    return this;
  }
}

class _$NotificationModule extends _i288.NotificationModule {}
