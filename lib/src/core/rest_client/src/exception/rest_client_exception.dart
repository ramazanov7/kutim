import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// coverage:ignore-start
/// Base class for all rest client exceptions
@immutable
abstract base class RestClientException extends Equatable implements Exception {
  /// {@macro network_exception}
  const RestClientException({
    required this.message,
    this.statusCode,
    required this.cause,
    this.reset = false,
  });

  /// Message of the exception
  final String message;

  /// The status code of the response (if any)
  final int? statusCode;

  /// The cause of the exception
  ///
  /// It is the exception that caused this exception to be thrown.
  ///
  /// If the exception is not caused by another exception, this field is `null`.
  final Object? cause;

  /// If the request should be reset
  final bool reset;
}

/// Base class for all rest client exceptions that have a cause
abstract base class RestClientExceptionWithCause extends RestClientException {
  const RestClientExceptionWithCause({
    required super.message,
    super.cause,
    super.statusCode,
    super.reset = false,
  });
}

/// {@template client_exception}
/// [ClientException] is thrown if something went wrong on client side
/// {@endtemplate}
final class ClientException extends RestClientException {
  /// {@macro client_exception}
  const ClientException({
    required super.message,
    super.statusCode,
    super.cause,
    super.reset = false,
  });

  @override
  String toString() => 'ClientException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause];
}

/// Exception that is used for structured backend errors
///
/// [error] is a map that contains the error details
///
/// This exception is raised by [RestClientBase] when the response contains
/// 'error' field like the following:
/// ```json
/// {
///  "error": {
///   "message": "Some error message",
///   "code": 123
/// }
/// ```
///
/// This class exists to make handling of structured errors easier.
/// Basically, in data providers that use [RestClientBase], you can catch
/// this exception and convert it to a system-wide error. For example,
/// if backend returns an error with code 123 that means that the action
/// is not allowed, you can convert this exception to a NotAllowedException
/// and rethrow. This way, the rest of the application does not need to know
/// about the structure of the error and should only handle system-wide
/// exceptions.
final class CustomBackendException extends RestClientException {
  /// {@macro structured_backend_exception}
  const CustomBackendException({
    required super.message,
    super.statusCode,
    super.reset = false,
    super.cause,
  });

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message, cause, statusCode];
}

/// [WrongResponseTypeException] is thrown if the response type
/// is not the expected one
final class WrongResponseTypeException extends RestClientException {
  /// {@macro wrong_response_type_exception}
  const WrongResponseTypeException({
    required super.message,
    super.cause,
    super.statusCode,
    super.reset = false,
  });

  @override
  String toString() => 'WrongResponseTypeException('
      'message: $message, '
      'statusCode: $statusCode, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, reset];

  WrongResponseTypeException copyWith({
    int? statusCode,
    String? message,
    bool? reset,
  }) =>
      WrongResponseTypeException(
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
        reset: reset ?? this.reset,
      );
}

/// [ConnectionException] is thrown if there are problems with the connection
final class ConnectionException extends RestClientExceptionWithCause {
  /// {@macro connection_exception}
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() => 'ConnectionException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause, reset];
}

/// If something went wrong on the server side
final class InternalServerException extends RestClientExceptionWithCause {
  const InternalServerException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() => 'InternalServerException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause, reset];
}
// coverage:ignore-end
