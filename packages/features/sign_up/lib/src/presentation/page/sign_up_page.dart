import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  final String? halo;
  const SignUpPage({super.key, @PathParam('halo') this.halo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Sign Up Page $halo')));
  }
}
