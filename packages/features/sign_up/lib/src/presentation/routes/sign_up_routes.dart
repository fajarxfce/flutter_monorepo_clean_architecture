import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/sign_up.dart';

part 'sign_up_routes.gr.dart';

@AutoRouterConfig()
class SignUpRoutes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: SignUpRoute.page)];
}
