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

  @override
  Widget buildBody(BuildContext context, SignInState state) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoading = state.status == SignInStatus.loading;

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
                  SizedBox(
                    width: double.infinity,
                    child: DoButton(
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
