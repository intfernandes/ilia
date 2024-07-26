interface class IException implements Exception {
  const IException({
    required this.message,
    this.stacktrace,
  });

  final String message;
  final dynamic stacktrace;
}

class ServerException implements IException {
  const ServerException({
    required this.message,
    this.stacktrace,
  });

  @override
  final String message;
  @override
  final dynamic stacktrace;
}
