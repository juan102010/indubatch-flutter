import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/usescases/usescases.dart';
import 'package:indubatch_movil/features/auth/data/models/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';


/// A use case for retrieving permits.
///
/// This use case implements the [Usescase] interface to retrieve permits based on the provided parameters.
/// It interacts with the authentication repository to fetch permits from the server.
class GetUrlCompanyUsescase
    implements Usescase<UsescaseGetUrlCompanyResult, ParamsGetUrlCompany> {
  final AuthRepository repository;

  GetUrlCompanyUsescase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UsescaseGetUrlCompanyResult>> call(
      ParamsGetUrlCompany params) async {
    final result = await repository.getCompany(
      empresa: params.empresa,
    );

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        UsescaseGetUrlCompanyResult(
          result: resp.result,
        ),
      ),
    );
  }
}

/// Represents the result of the get permits use case.
///
/// This class holds the response entity containing permits retrieved from the server.
class UsescaseGetUrlCompanyResult {
  final List<GetCompanyModel> result;

  UsescaseGetUrlCompanyResult({
    required this.result,
  });
}

/// Parameters for the get permits use case.
///
/// This class holds the required parameters for fetching permits.
class ParamsGetUrlCompany {
  final String empresa;

  ParamsGetUrlCompany({
    required this.empresa,
  });
}
