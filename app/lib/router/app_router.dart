import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:main/main.dart';
import 'package:navigation/navigation.dart';
import 'package:profile/profile.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';
import 'package:splash/splash.dart';

import 'auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard;

  AppRouter({required this.authGuard});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: AppRoutes.splash, initial: true),
    AutoRoute(page: SignInRoute.page, path: AppRoutes.signIn),
    AutoRoute(page: SignUpRoute.page, path: AppRoutes.signUp),
    AutoRoute(
      page: MainRoute.page,
      path: AppRoutes.main,
      guards: [authGuard],
      children: [
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home),
        AutoRoute(page: DummyHistoryRoute.page, path: AppRoutes.history),
        AutoRoute(page: DummyInventoryRoute.page, path: AppRoutes.inventory),
        AutoRoute(page: ProfileRoute.page, path: AppRoutes.profile),
      ],
    ),
    AutoRoute(
      page: DummyDetailRoute.page,
      path: AppRoutes.detail,
      guards: [authGuard],
    ),
  ];
}
