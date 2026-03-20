import 'package:auto_route/auto_route.dart';
import 'package:home/home.dart';
import 'package:main/main.dart';
import 'package:navigation/navigation.dart';
import 'package:profile/profile.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page, path: AppRoutes.signIn, initial: true),
    AutoRoute(page: SignUpRoute.page, path: AppRoutes.signUp),
    AutoRoute(
      page: MainRoute.page,
      path: AppRoutes.main,
      children: [
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home),
        AutoRoute(page: ProfileRoute.page, path: AppRoutes.profile),
      ],
    ),
  ];
}
