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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.dev,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await configureDependencies();

  final notificationService = GetIt.I<NotificationService>();
  await notificationService.initialize();
  debugPrint('token: ${await notificationService.getToken()}');

  final appRouter = GetIt.I<AppRouter>();
  final notificationHandler = NotificationHandler(appRouter);
  notificationHandler.listen();

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
