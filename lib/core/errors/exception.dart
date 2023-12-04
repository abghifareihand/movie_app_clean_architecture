class ServerException implements Exception {
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}