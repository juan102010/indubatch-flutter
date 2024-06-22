import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/usescases/usescases.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/response_initial_data_model.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';

/// A use case for retrieving permits.
///
/// This use case implements the [Usescase] interface to retrieve permits based on the provided parameters.
/// It interacts with the authentication repository to fetch permits from the server.
class GetInitialDataUsescase
    implements Usescase<UsescaseGetInitialDataResult, NoParams> {
  final AuthRepository repository;

  GetInitialDataUsescase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UsescaseGetInitialDataResult>> call(
      NoParams params) async {
    final result = await repository.initialData();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        UsescaseGetInitialDataResult(
          result: resp.result,
        ),
      ),
    );
  }
}

/// Represents the result of the get permits use case.
///
/// This class holds the response entity containing permits retrieved from the server.
class UsescaseGetInitialDataResult {
  final InitialDataResponseModel result;

  UsescaseGetInitialDataResult({
    required this.result,
  });
}
