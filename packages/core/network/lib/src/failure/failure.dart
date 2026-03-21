abstract class Failure {
  const Failure();

  String get message;
}

// General failures
class ServerFailure extends Failure {
  final String _message;

  const ServerFailure(this._message);

  @override
  String get message => _message;
}

class NetworkFailure extends Failure {
  final String _message;

  const NetworkFailure(this._message);

  @override
  String get message => _message;
}

class CacheFailure extends Failure {
  final String _message;

  const CacheFailure(this._message);

  @override
  String get message => _message;
}

class ValidationFailure extends Failure {
  final String _message;

  const ValidationFailure(this._message);

  @override
  String get message => _message;
}

class UnauthorizedFailure extends Failure {
  final String _message;

  const UnauthorizedFailure(this._message);

  @override
  String get message => _message;
}

class NotFoundFailure extends Failure {
  final String _message;

  const NotFoundFailure(this._message);

  @override
  String get message => _message;
}

class UnknownFailure extends Failure {
  final String _message;

  const UnknownFailure(this._message);

  @override
  String get message => _message;
}

class ConflictFailure extends Failure {
  final String _message;

  const ConflictFailure(this._message);

  @override
  String get message => _message;
}

class DioFailure extends Failure {
  final String _message;

  const DioFailure(this._message);

  @override
  String get message => _message;
}
