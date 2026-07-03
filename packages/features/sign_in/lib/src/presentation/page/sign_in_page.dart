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
  bool _obscurePassword = true;

  @override
  SignInBloc createBloc() => GetIt.instance<SignInBloc>();

  @override
  void onInit() {
    super.onInit();
    // Pre-fill email from persisted state if remember me was checked
    final savedEmail = bloc.state.savedEmail;
    if (savedEmail.isNotEmpty) {
      _emailCtrl.text = savedEmail;
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context, SignInState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        final isLoading = state.status == SignInStatus.loading;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                    : [const Color(0xFFF0F4FF), const Color(0xFFE8EEFF)],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo / Icon
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.primary.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Title
                      const DoText("Welcome Back", variant: DoTextVariant.h2),
                      const SizedBox(height: 8),
                      DoText(
                        "Sign in to continue to your account",
                        variant: DoTextVariant.body,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: 36),

                      // Card Form
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E293B)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.08)
                                : Colors.black.withValues(alpha: 0.04),
                          ),
                        ),
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Email Field
                            DoTextField(
                              controller: _emailCtrl,
                              label: 'Email Address',
                              hintText: 'you@example.com',
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 20,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Password Field
                            DoTextField(
                              controller: _passwordCtrl,
                              obscureText: _obscurePassword,
                              label: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                size: 20,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 20,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Remember Me & Forgot Password Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DoCheckbox(
                                  value: state.rememberMe,
                                  onChanged: (val) {
                                    context.read<SignInBloc>().add(
                                      SignInRememberMeChanged(
                                        value: val ?? false,
                                      ),
                                    );
                                  },
                                  label: 'Remember me',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // TODO: Navigate to forgot password
                                  },
                                  child: DoText(
                                    "Forgot password?",
                                    variant: DoTextVariant.caption,
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),

                            // Error Message
                            if (state.status == SignInStatus.failure &&
                                state.message.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.error.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: colorScheme.error.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.error_outline_rounded,
                                        size: 18,
                                        color: colorScheme.error,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: DoText(
                                          state.message,
                                          variant: DoTextVariant.caption,
                                          color: colorScheme.error,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Sign In Button
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Divider with "or"
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: DoText(
                              "or",
                              variant: DoTextVariant.caption,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DoText(
                            "Don't have an account? ",
                            variant: DoTextVariant.body,
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.pushPath(
                                AppRoutes.signUpPath('Anjasss'),
                              );
                            },
                            child: DoText(
                              "Sign Up",
                              variant: DoTextVariant.body,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
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
