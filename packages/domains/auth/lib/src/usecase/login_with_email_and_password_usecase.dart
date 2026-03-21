import 'package:auth_domain/auth.dart';
import 'package:network/network.dart';
import 'package:shared/dartz.dart';
import 'package:shared/shared.dart';

part 'login_with_email_and_password_usecase.g.dart';

@singleton
class LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  LoginWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, Login>> call(LoginRequest request) async {
    return await _authRepository.loginWithEmailAndPassword(request);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
