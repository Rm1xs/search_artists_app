import 'package:dartz/dartz.dart';
import 'package:search_artists_app/core/error/failures.dart';

class InputConverter {
  Either<Failure, String> stringToUnsignedInteger(String str) {
    try {
      if (str.length == 0) throw FormatException();
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
class InvalidInputFailure extends Failure {}