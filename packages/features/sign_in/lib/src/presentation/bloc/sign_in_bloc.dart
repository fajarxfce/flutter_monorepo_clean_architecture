import 'package:auth_domain/auth.dart';
import 'package:shared/shared.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_effect.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_event.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_state.dart';

@injectable
class SignInBloc extends BlocFx<SignInEvent, SignInState, SignInEffect> {
  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;

  SignInBloc(this._loginWithEmailAndPasswordUsecase) : super(SignInState()) {
    on<SignInSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    final result = await _loginWithEmailAndPasswordUsecase(
      LoginRequest(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(status: SignInStatus.failure, message: failure.message),
      ),
      (login) =>
          emit(state.copyWith(status: SignInStatus.success, loginData: login)),
    );
  }
}
