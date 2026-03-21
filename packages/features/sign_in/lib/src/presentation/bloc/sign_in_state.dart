import 'package:auth_domain/auth.dart';
import 'package:shared/shared.dart';

part 'sign_in_state.freezed.dart';

enum SignInStatus { initial, loading, success, failure }

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default(SignInStatus.initial) SignInStatus status,
    @Default('') String message,
    Login? loginData,
  }) = _SignInState;
}
