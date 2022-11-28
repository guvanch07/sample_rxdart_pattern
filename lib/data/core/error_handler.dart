class ServerException implements Exception {
  dynamic message;
  ServerException([this.message]);
}

class CacheException implements Exception {}

class ConfirmCodeException implements Exception {}

class CreateUserException implements Exception {}

class GetUserProfileException implements Exception {}

class ToManyRequestsException implements Exception {}

class BadRequestException implements Exception {
  dynamic message;
  BadRequestException([this.message]);
}

class NotFoundException implements Exception {
  dynamic message;
  NotFoundException([this.message]);
}

class PasswordMismatchException implements Exception {
  /// account_password_mismatch
}

class AccountNotFoundException implements Exception {
  /// account_not_found server response
}

class WrongEmailException implements Exception {
  /// must_be_valid_email_address server response
}

class EmailAlreadyBeenTakenException implements Exception {
  /// has_already_been_taken
}

class CreateOwnProjectException implements Exception {}

class FetchVocabulariesException implements Exception {}

class FetchDataException implements Exception {}

class UnauthorisedException implements Exception {}

class LocalAuthenificationException implements Exception {}
