import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';

import '../../../../core/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/server_api_client.dart';

import '../datasources/auth_datasource.dart';

class AuthRepositoryImp implements AuthRepository {
  // final LocalStorageRepository localStorageRepository;
  final AuthDatasource authDataSource;
  final ServerApiClient apiClient;

  AuthRepositoryImp({
    // required this.localStorageRepository,
    required this.authDataSource,
    required this.apiClient,
  });

  @override
  Future<Either<Failure, UsescaseGetUrlCompanyResult>> getCompany({
    required String empresa,
  }) async {
    try {
      final result = await authDataSource.getCompany(empresa: empresa);

      return Right(
        UsescaseGetUrlCompanyResult(result: result),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
      ));
    } on AuthenticationException {
      // Return left side with AuthenticationFailure if AuthenticationException occurs
      return Left(AuthenticationFailure());
    } on ConnectionException {
      // Return left side with ConnectionFailure if ConnectionException occurs
      return Left(ConnectionFailure());
    } on Object catch (e) {
      // Return left side with ErrorFailure for any other exception
      return Left(ErrorFailure(error: e));
    }
  }
}
