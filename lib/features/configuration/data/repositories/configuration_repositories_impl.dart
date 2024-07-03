import 'package:indubatch_movil/features/configuration/data/datasources/configuration_datasource.dart';
import 'package:indubatch_movil/features/configuration/data/models/post_configuration_model.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/post_configuration_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/repositories/configuration_repository.dart';
import 'package:indubatch_movil/features/configuration/domain/usescases/post_configuration_usecase.dart';

import '../../../../core/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/server_api_client.dart';

class ConfigurationRepositoriesImpl implements ConfigurationRepository {
  final ConfigurationDatasource configurationDatasource;
  final ServerApiClient apiClient;

  ConfigurationRepositoriesImpl({
    required this.configurationDatasource,
    required this.apiClient,
  });

  @override
  Future<Either<Failure, UsescasePostConfigurationResult>> postConfiguration(
      {required PostConfigurationEntity postConfigurationEntity,
      required String url}) async {
    try {
      PostConfigurationModel newConfigurationModel =
          PostConfigurationModel.postConfigurationEntityToModel(
              postConfigurationEntity);
      final result = await configurationDatasource.postConfiguration(
          postConfigurationModel: newConfigurationModel, url: url);

      return Right(
        UsescasePostConfigurationResult(result: result),
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
}
