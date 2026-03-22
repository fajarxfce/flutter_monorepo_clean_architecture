import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_event.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_state.dart';
import 'package:widgets/widgets.dart';

import '../bloc/sign_in_bloc.dart';

@RoutePage()
class SignInPage extends BaseStatefulPage<SignInBloc, SignInState> {
  const SignInPage({super.key});

  @override
  BaseStatefulPageState<SignInBloc, SignInState, SignInPage> createState() =>
      _SignInPageState();
}

class _SignInPageState
    extends BaseStatefulPageState<SignInBloc, SignInState, SignInPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  SignInBloc createBloc() => GetIt.instance<SignInBloc>();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  bool _rememberMe = false;

  @override
  Widget buildBody(BuildContext context, SignInState state) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoading = state.status == SignInStatus.loading;

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: DoCard(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const DoText("Welcome Back", variant: DoTextVariant.h3),
                        const SizedBox(height: 8),
                        const DoText(
                          "Please enter your details to sign in.",
                          variant: DoTextVariant.body,
                        ),
                        const SizedBox(height: 32),
                        DoTextField(
                          controller: _emailCtrl,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        DoTextField(
                          controller: _passwordCtrl,
                          obscureText: true,
                          label: 'Password',
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DoCheckbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                              label: 'Remember me',
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        DoButton(
                          isLoading: isLoading,
                          variant: DoButtonVariant.primary,
                          onPressed: () {
                            context.read<SignInBloc>().add(
                              SignInSubmitted(
                                email: _emailCtrl.text,
                                password: _passwordCtrl.text,
                              ),
                            );
                          },
                          text: 'Sign In',
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DoText(
                              "Don't have an account? ",
                              variant: DoTextVariant.body,
                            ),
                            InkWell(
                              onTap: () {
                                context.router.pushPath(
                                  AppRoutes.signUpPath('Anjasss'),
                                );
                              },
                              child: DoText(
                                "Sign Up",
                                variant: DoTextVariant.body,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
