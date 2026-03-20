import 'package:auto_route/auto_route.dart';
import 'package:sign_in/sign_in.dart';

part 'sign_in_routes.gr.dart';

@AutoRouterConfig()
class SignInRoutes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: SignInRoute.page)];
}
