import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app/router/app_router.dart';
import 'package:app/di/di.dart';
import 'package:widgets/widgets.dart';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'flavors.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:notifications/notifications.dart';
import 'package:app/router/notification_handler.dart';
import 'firebase_options.dart';
import 'package:workmanager/workmanager.dart';
import 'package:sync/syncronizer.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    // 1. Setup DI - Pastikan semua file di memory isolate terinisialisasi
    await configureDependencies();

    // 2. Ambil Registry untuk merutekan WorkerTask
    final registry = GetIt.I<WorkerRegistry>();
    
    // 3. Eksekusi worker task-nya
    final result = await registry.executeTask(taskName, inputData);

    return result == WorkerResult.success;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.dev,
  );

  if (!Platform.isLinux) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  await configureDependencies();

  if (!Platform.isLinux) {
    Workmanager().initialize(
      callbackDispatcher, // Fungsi top-level ini dilimpahkan ke workmanager
      isInDebugMode: F.appFlavor == Flavor.dev, // Hanya nyala saat dev
    );
  }

  final appRouter = GetIt.I<AppRouter>();

  if (!Platform.isLinux) {
    final notificationService = GetIt.I<NotificationService>();
    await notificationService.initialize();
    debugPrint('token: ${await notificationService.getToken()}');

    final notificationHandler = NotificationHandler(appRouter);
    notificationHandler.listen();
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(
      title: F.title,
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: DOTheme.light,
      darkTheme: DOTheme.dark,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        if (F.appFlavor == Flavor.dev && child != null) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Banner(
              color: Colors.red,
              message: F.name.toUpperCase(),
              location: BannerLocation.topEnd,
              child: child,
            ),
          );
        }
        return child!;
      },
    );
  }
}
