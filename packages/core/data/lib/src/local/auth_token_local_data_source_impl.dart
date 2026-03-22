import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared/shared.dart';

import 'auth_token_local_data_source.dart';

@LazySingleton(as: AuthTokenLocalDataSource)
class AuthTokenLocalDataSourceImpl implements AuthTokenLocalDataSource {
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'ACCESS_TOKEN_KEY';

  AuthTokenLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
