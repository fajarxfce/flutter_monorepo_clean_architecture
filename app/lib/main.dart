import 'package:flutter/material.dart';
import 'package:app/router/app_router.dart';
import 'package:app/di/di.dart';
import 'package:widgets/widgets.dart';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set target flavor sebelum apps run (dikirim via terminal --flavor)
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.dev, // default ke dev jika null
  );

  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(
      title: F.title, // Menggunakan title dari Flavor
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: DOTheme.light,
      darkTheme: DOTheme.dark,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        // Tampilkan banner kalo lagi di environment dev
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
