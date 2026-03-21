import 'package:auth_data/src/source/response/login_dto.dart';
import 'package:auth_domain/auth.dart';

extension LoginDTOMapper on LoginDTO {
  Login toDomain() =>
      Login(accessToken: accessToken, refreshToken: refreshToken);
}
