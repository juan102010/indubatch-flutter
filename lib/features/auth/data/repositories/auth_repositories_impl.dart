import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/features/auth/data/models/login/login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/company/response_get_company_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/response_login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_initial_data_usescases.dart';
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
      return Left(AuthenticationFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
  @override
  Future<Either<Failure, UsescasePostLoginResult>> login({
    required LoginEntity loginEntity,
  }) async {
    try {
      LoginModel newLoginModel = LoginModel.loginEntityToModel(loginEntity);
      final result = await authDataSource.login(loginModel: newLoginModel);
      LoginResponseEntity response = const LoginResponseEntity.empty();

      if (result.token!.isNotEmpty) {
        response = await localStorageRepository.setSecureUserInfoStorage(
          model: result,
        );
        apiClient.setAccessToken(accessToken: result.token!);
      }

      return Right(
        UsescasePostLoginResult(result: response),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
      ));
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
  
  @override
  Future<Either<Failure, UsescaseGetInitialDataResult>> initialData() async {
    try {

      final result = await authDataSource.initialData();
      return Right(
        UsescaseGetInitialDataResult(result: result),
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
