sealed class ErrorRequest {}

class NetworkError extends ErrorRequest {}

class TimeoutError extends ErrorRequest {
  final String path;

  TimeoutError({required this.path});
}

class ServerError extends ErrorRequest {
  final int? statusCode;
  final String path;
  final dynamic cause;

  ServerError({
    required this.statusCode,
    required this.path,
    required this.cause,
  });
}
