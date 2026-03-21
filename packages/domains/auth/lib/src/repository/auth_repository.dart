import 'package:auth_domain/src/model/login.dart';
import 'package:auth_domain/src/usecase/login_with_email_and_password_usecase.dart';
import 'package:network/network.dart';
import 'package:shared/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginRequest request,
  );
}
