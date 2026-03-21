import 'package:auth_data/src/mapper/login_mapper.dart';
import 'package:auth_data/src/source/auth_remote_datasource.dart';
import 'package:auth_domain/auth.dart';
import 'package:network/network.dart';
import 'package:shared/dartz.dart';
import 'package:shared/shared.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginRequest request,
  ) async {
    return safeApiCall(() async {
      final response = await _remoteDatasource.loginWithEmailAndPassword(
        request,
      );
      return response.toDomain();
    });
  }
}
