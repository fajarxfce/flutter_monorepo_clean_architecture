import 'package:flutter/material.dart';
import 'package:app/router/app_router.dart';
import 'package:app/di/di.dart';

import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(routerConfig: appRouter.config());
  }
}
