import 'package:network/src/failure/failure.dart';
import 'package:shared/dartz.dart';
import 'package:shared/shared.dart';

Future<Either<Failure, T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return Right(result);
  } on DioException catch (e) {
    return Left(_dioExceptionMapper(e));
  }
}

Failure _dioExceptionMapper(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return ServerFailure('Connection timed out. Please try again later.');
    case DioExceptionType.badResponse:
      return ServerFailure('An error occurred while processing your request.');
    case DioExceptionType.cancel:
      return ServerFailure('Request cancelled.');
    case DioExceptionType.unknown:
    default:
      return UnknownFailure(
        'An unexpected error occurred. Please try again later.',
      );
  }
}
