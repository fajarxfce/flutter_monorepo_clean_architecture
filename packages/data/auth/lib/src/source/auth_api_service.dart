import 'package:auth_data/src/source/response/login_dto.dart';
import 'package:auth_domain/auth.dart';
import 'package:shared/shared.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/login')
  Future<LoginDTO> loginWithEmailAndPassword(@Body() Map<String, dynamic> body);
}
