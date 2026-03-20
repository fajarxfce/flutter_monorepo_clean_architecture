import 'package:auto_route/auto_route.dart';
import 'package:navigation/navigation.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page, path: AppRoutes.signIn, initial: true),
    AutoRoute(page: SignUpRoute.page, path: AppRoutes.signUp),
  ];
}
