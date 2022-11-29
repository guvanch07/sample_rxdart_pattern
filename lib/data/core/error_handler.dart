class ServerException implements Exception {
  dynamic message;
  ServerException([this.message]);
}

class CacheException implements Exception {}

class ToManyRequestsException implements Exception {}

class BadRequestException implements Exception {
  dynamic message;
  BadRequestException([this.message]);
}

class NotFoundException implements Exception {
  dynamic message;
  NotFoundException([this.message]);
}

class FetchVocabulariesException implements Exception {}

class FetchDataException implements Exception {}

class UnauthorisedException implements Exception {}

class LocalAuthenificationException implements Exception {}
