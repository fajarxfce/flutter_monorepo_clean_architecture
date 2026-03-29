import 'package:auth_domain/auth.dart';
import 'package:network/network.dart';
import 'package:shared/dartz.dart';
import 'package:shared/shared.dart';

@singleton
class LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  LoginWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, Login>> call(LoginRequest request) async {
    return await _authRepository.loginWithEmailAndPassword(request);
  }
}

/// Plain domain model — no JSON annotations, no framework dependencies.
/// Serialization is the data layer's responsibility.
class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});
}
