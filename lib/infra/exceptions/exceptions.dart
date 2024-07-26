class ServerException implements Exception {}

interface class IException implements Exception {
  const IException({
    required this.message,
    this.stacktrace,
  });

  final String message;
  final dynamic stacktrace;
}
