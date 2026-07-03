import 'package:auth_domain/auth.dart';
import 'package:shared/shared.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_effect.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_event.dart';
import 'package:sign_in/src/presentation/bloc/sign_in_state.dart';

@injectable
class SignInBloc
    extends PersistedBlocFx<SignInEvent, SignInState, SignInEffect> {
  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;

  SignInBloc(this._loginWithEmailAndPasswordUsecase) : super(SignInState()) {
    on<SignInSubmitted>(_onSubmitted);
    on<SignInRememberMeChanged>(_onRememberMeChanged);
  }

  @override
  String get storageKey => 'sign_in_bloc';

  @override
  Map<String, dynamic> toJson(SignInState state) {
    return {
      'rememberMe': state.rememberMe,
      'savedEmail': state.savedEmail,
    };
  }

  @override
  SignInState fromJson(Map<String, dynamic> json) {
    return SignInState(
      rememberMe: json['rememberMe'] as bool? ?? false,
      savedEmail: json['savedEmail'] as String? ?? '',
    );
  }

  void _onRememberMeChanged(
    SignInRememberMeChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(rememberMe: event.value));
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));

    // Save email if remember me is checked
    if (state.rememberMe) {
      emit(state.copyWith(savedEmail: event.email));
    } else {
      emit(state.copyWith(savedEmail: ''));
    }

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
