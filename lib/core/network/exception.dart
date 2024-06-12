// This class is to capture the server events  that return Exception

class ServerException implements Exception {
  final String? message;

  ServerException({
    this.message,
  }) : super();
}

class CacheException implements Exception {
  final String? message;

  CacheException({
    this.message,
  }) : super();
}

class ConnectionException implements Exception {}

class AuthenticationException implements Exception {
  final String? message;

  AuthenticationException({
    this.message,
  }) : super();
}


