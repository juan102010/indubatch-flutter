import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/features/auth/data/models/login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/response_get_company_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/response_login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/post_login_usecase.dart';

import '../../../../core/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/server_api_client.dart';

import '../datasources/auth_datasource.dart';

class AuthRepositoryImp implements AuthRepository {
  final LocalStorageRepository localStorageRepository;
  final AuthDatasource authDataSource;
  final ServerApiClient apiClient;

  AuthRepositoryImp({
    required this.localStorageRepository,
    required this.authDataSource,
    required this.apiClient,
  });

  @override
  Future<Either<Failure, UsescaseGetUrlCompanyResult>> getCompany({
    required String empresa,
  }) async {
    try {
      final result = await authDataSource.getCompany(empresa: empresa);

      // ignore: unused_local_variable
      GetCompanyEntity response = const GetCompanyEntity.empty();
      if (result.first.url!.isNotEmpty) {
        response = await localStorageRepository.setSecureUrlInfoStorage(
          model: result.first,
        );
      }
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
   @override
  Future<Either<Failure, UsescasePostLoginResult>> login({
    required LoginEntity loginEntity,
  }) async {
    try {
      // Convert LoginEntity to LoginModel
      LoginModel newLoginModel = LoginModel.loginEntityToModel(loginEntity);
      // Call login method in authDataSource
      final result = await authDataSource.login(loginModel: newLoginModel);
      // Initialize LoginResponseEntity with empty values
      LoginResponseEntity response = const LoginResponseEntity.empty();

      // If token is not empty, set token info in local storage
      if (result.token!.isNotEmpty) {
        response = await localStorageRepository.setSecureUserInfoStorage(
          model: result,
        );
        // Set access token in apiClient
        apiClient.setAccessToken(accessToken: result.token!);
      }

      // Return right side with UsescasePostLoginResult
      return Right(
        UsescasePostLoginResult(result: response),
      );
    } on ServerException catch (e) {
      // Return left side with ServerFailure if ServerException occurs
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
