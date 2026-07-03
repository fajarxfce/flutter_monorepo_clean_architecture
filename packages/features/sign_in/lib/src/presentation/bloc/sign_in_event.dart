sealed class SignInEvent {
  const SignInEvent();
}

/// User submit form sign in
final class SignInSubmitted extends SignInEvent {
  final String email;
  final String password;

  const SignInSubmitted({required this.email, required this.password});
}

/// User toggle remember me checkbox
final class SignInRememberMeChanged extends SignInEvent {
  final bool value;

  const SignInRememberMeChanged({required this.value});
}

/// User tap "Go to Sign Up"
final class SignInGoToSignUpPressed extends SignInEvent {
  const SignInGoToSignUpPressed();
}
