import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared/shared.dart';

import 'credential_local_data_source.dart';

@LazySingleton(as: CredentialLocalDataSource)
class CredentialLocalDataSourceImpl implements CredentialLocalDataSource {
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'ACCESS_TOKEN_KEY';

  CredentialLocalDataSourceImpl(this._storage);

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
