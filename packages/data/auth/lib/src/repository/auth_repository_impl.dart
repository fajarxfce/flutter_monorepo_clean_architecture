import 'package:auth_data/src/mapper/login_mapper.dart';
import 'package:auth_data/src/source/auth_remote_datasource.dart';
import 'package:auth_domain/auth.dart';
import 'package:data/data.dart';
import 'package:network/network.dart';
import 'package:shared/dartz.dart';
import 'package:shared/shared.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthTokenLocalDataSource _tokenDataSource;

  AuthRepositoryImpl(this._remoteDatasource, this._tokenDataSource);

  @override
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginRequest request,
  ) async {
    return safeApiCall(() async {
      final response = await _remoteDatasource.loginWithEmailAndPassword(
        request,
      );

      // Save token to local secure storage
      if (response.token != null) {
        await _tokenDataSource.saveToken(response.token!);
      }

      return response.toDomain();
    });
  }
}
