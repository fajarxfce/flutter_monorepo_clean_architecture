sealed class SignInEvent {
  const SignInEvent();
}

/// User submit form sign in
final class SignInSubmitted extends SignInEvent {
  final String email;
  final String password;

  const SignInSubmitted({required this.email, required this.password});
}

/// User tap "Go to Sign Up"
final class SignInGoToSignUpPressed extends SignInEvent {
  const SignInGoToSignUpPressed();
}
