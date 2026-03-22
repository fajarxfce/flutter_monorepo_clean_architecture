import 'package:data/data.dart';
import 'package:shared/shared.dart';

import 'splash_event.dart';
import 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthTokenLocalDataSource _tokenDataSource;

  SplashBloc(this._tokenDataSource) : super(const SplashState.initial()) {
    on<CheckAuth>(_onCheckAuth);
  }

  Future<void> _onCheckAuth(CheckAuth event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2));

    final token = await _tokenDataSource.getToken();

    if (token != null && token.isNotEmpty) {
      emit(const SplashState.authenticated());
    } else {
      emit(const SplashState.unauthenticated());
    }
  }
}
