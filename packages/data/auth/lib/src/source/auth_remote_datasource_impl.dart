import 'package:auth_data/src/source/auth_api_service.dart';
import 'package:auth_data/src/source/auth_remote_datasource.dart';
import 'package:auth_data/src/source/response/login_dto.dart';
import 'package:auth_domain/auth.dart';
import 'package:shared/shared.dart';

@Singleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApiService _authApiService;

  AuthRemoteDatasourceImpl(this._authApiService);

  @override
  Future<LoginDTO> loginWithEmailAndPassword(LoginRequest request) {
    return _authApiService.loginWithEmailAndPassword(request.toJson());
  }
}
