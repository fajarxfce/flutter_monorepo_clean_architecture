import 'package:auth_data/src/source/response/login_dto.dart';
import 'package:auth_domain/auth.dart';

abstract class AuthRemoteDatasource {
  Future<LoginDTO> loginWithEmailAndPassword(LoginRequest request);
}
