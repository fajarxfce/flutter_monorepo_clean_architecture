import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:main/main.dart';
import 'package:notifications/notifications.dart';

import 'app_router.dart';

class NotificationHandler {
  final NotificationService _notificationService = GetIt.I<NotificationService>();
  final AppRouter appRouter;

  NotificationHandler(this.appRouter);

  /// Panggil setelah runApp agar router udah siap menerima navigasi.
  void listen() {
    // 1. Foreground & background taps
    _notificationService.onNotificationOpened.listen((routePath) {
      if (routePath.isNotEmpty) {
        appRouter.pushPath(routePath);
      }
    });

    // 2. Cold-start (app terminated): tunggu frame pertama baru navigate
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final initialRoute = await _notificationService.checkInitialRoute();
      if (initialRoute != null && initialRoute.isNotEmpty) {
        // pushAll buat seed stack yang bener:
        // [Main → Detail], kalau back → ke Main, bukan keluar
        await appRouter.pushAll([
          const MainRoute(),
          DummyDetailRoute(id: _extractId(initialRoute)),
        ]);
      }
    });
  }

  /// Ambil segment terakhir dari route path sebagai ID.
  /// Contoh: "/detail/ORDER123" → "ORDER123"
  String _extractId(String route) {
    final segments = route.split('/');
    return segments.isNotEmpty ? segments.last : route;
  }
}
