

class AppException implements Exception{

  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix $_message';
  }

}

class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message, 'Error During Communication');
}

class BadRequestException extends AppException{

  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedException extends AppException{

  UnauthorisedException([String? message]) : super(message, 'Unauthorised Exception');
}

class InvalidInputException extends AppException{

  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class InternetException extends AppException{

  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeoutException extends AppException{

  RequestTimeoutException([String? message]) : super(message, 'Request timeout');
}

class ServerException extends AppException{

  ServerException([String? message]) : super(message, 'Internal Server Error');
}