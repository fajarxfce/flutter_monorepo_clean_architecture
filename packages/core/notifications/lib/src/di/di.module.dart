//@GeneratedMicroModule;NotificationsPackageModule;package:notifications/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notifications/src/data/fcm_notification_service_impl.dart'
    as _i192;
import 'package:notifications/src/di/notification_module.dart' as _i400;
import 'package:notifications/src/domain/notification_service.dart' as _i412;

class NotificationsPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final notificationModule = _$NotificationModule();
    gh.lazySingleton<_i892.FirebaseMessaging>(
        () => notificationModule.firebaseMessaging);
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
        () => notificationModule.flutterLocalNotificationsPlugin);
    gh.lazySingleton<_i412.NotificationService>(
        () => _i192.FcmNotificationServiceImpl(
              gh<_i892.FirebaseMessaging>(),
              gh<_i163.FlutterLocalNotificationsPlugin>(),
            ));
  }
}

class _$NotificationModule extends _i400.NotificationModule {}
