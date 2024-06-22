import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/usescases/usescases.dart';
import 'package:indubatch_movil/features/auth/data/models/company/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';

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

class UsescaseGetUrlCompanyResult {
  final List<GetCompanyModel> result;

  UsescaseGetUrlCompanyResult({
    required this.result,
  });
}

class ParamsGetUrlCompany {
  final String empresa;

  ParamsGetUrlCompany({
    required this.empresa,
  });
}
