part of 'sign_in_bloc.dart';

sealed class SignInState {
  const SignInState();
}

final class SignInInitial extends SignInState {
  const SignInInitial();
}

final class SignInLoading extends SignInState {
  const SignInLoading();
}

final class SignInFailure extends SignInState {
  final String message;
  const SignInFailure(this.message);
}

// No SignInSuccess state — on success we navigate away (BLoC calls AppNavigator)
// so there's nothing to show. If you need to emit something (e.g. for analytics),
// you can add it here.
