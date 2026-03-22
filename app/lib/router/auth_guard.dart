import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:sign_in/sign_in.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthTokenLocalDataSource tokenDataSource;

  AuthGuard(this.tokenDataSource);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = await tokenDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      resolver.next(true);
    } else {
      router.push(const SignInRoute());
      resolver.next(false);
    }
  }
}
