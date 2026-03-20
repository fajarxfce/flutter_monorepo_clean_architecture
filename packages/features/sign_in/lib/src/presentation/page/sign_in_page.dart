import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/navigation.dart';
import 'package:widgets/widgets.dart';

import '../bloc/sign_in_bloc.dart';

@RoutePage()
class SignInPage extends StatefulWidget implements AutoRouteWrapper {
  const SignInPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SignInBloc>(),
      child: this,
    );
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is SignInLoading;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: DoCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DoText("Login to Your Account", variant: DoTextVariant.h3),
                  SizedBox(height: 16),
                  DoTextField(
                    controller: _emailCtrl,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  DoTextField(
                    controller: _passwordCtrl,
                    obscureText: true,
                    label: 'Password',
                  ),
                  const SizedBox(height: 24),

                  // Sign In button — fires SignInSubmitted event
                  DoButton(
                    variant: DoButtonVariant.primary,
                    onPressed: isLoading
                        ? null
                        : () => context.read<SignInBloc>().add(
                            SignInSubmitted(
                              email: _emailCtrl.text,
                              password: _passwordCtrl.text,
                            ),
                          ),
                    text: 'Sign In',
                  ),
                  const SizedBox(height: 12),

                  // Go to Sign Up — fires SignInGoToSignUpPressed event
                  TextButton(
                    onPressed: () {
                      context.router.pushPath(AppRoutes.signUpPath('Anjasss'));
                    },
                    child: const Text("Don't have an account? Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
