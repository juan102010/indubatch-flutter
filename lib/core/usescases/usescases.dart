import 'package:dartz/dartz.dart';
import '../network/failure.dart';

/// The above code defines an abstract class called Usescase that represents a use case in Dart, and a
/// class called NoParams that represents an empty parameter.
abstract class Usescase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
