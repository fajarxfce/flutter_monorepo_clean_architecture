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
      return const ServerFailure(
        'Connection timed out. Please try again later.',
      );
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final errorMessage = _extractErrorMessage(e.response?.data);

      if (statusCode != null) {
        if (statusCode == 401 || statusCode == 403) {
          return UnauthorizedFailure(errorMessage ?? 'Unauthorized access.');
        } else if (statusCode == 404) {
          return NotFoundFailure(errorMessage ?? 'Resource not found.');
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationFailure(errorMessage ?? 'Invalid data provided.');
        } else if (statusCode == 409) {
          return ConflictFailure(errorMessage ?? 'Data conflict occurred.');
        } else if (statusCode >= 500) {
          return ServerFailure(errorMessage ?? 'Internal server error.');
        }
      }

      return ServerFailure(
        errorMessage ?? 'An error occurred while processing your request.',
      );
    case DioExceptionType.cancel:
      return const ServerFailure('Request cancelled.');
    case DioExceptionType.connectionError:
      return const NetworkFailure('No internet connection.');
    case DioExceptionType.unknown:
    default:
      return const UnknownFailure(
        'An unexpected error occurred. Please try again later.',
      );
  }
}

String? _extractErrorMessage(dynamic data) {
  if (data is Map<String, dynamic>) {
    // Coba extract dari berbagai konvensi field umum
    if (data.containsKey('message')) {
      final msg = data['message'];
      if (msg is String) return msg;
    }
    if (data.containsKey('error')) {
      final error = data['error'];
      if (error is String) return error;
    }
  } else if (data is String) {
    return data.isNotEmpty ? data : null;
  }
  return null;
}
