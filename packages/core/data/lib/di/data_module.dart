import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared/shared.dart';

@module
abstract class DataModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
