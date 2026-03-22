import 'package:auth_data/src/source/response/login_dto.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/v1/login')
  Future<BaseResponse<LoginDTO>> loginWithEmailAndPassword(
    @Body() Map<String, dynamic> body,
  );
}
