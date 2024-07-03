import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/features/configuration/data/models/response_post_configuration_model.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/post_configuration_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/repositories/configuration_repository.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';


class PostConfigurationUsescase
    implements Usescase<UsescasePostConfigurationResult, ParamsUsescasePostConfiguration> {
  final ConfigurationRepository repository;


  PostConfigurationUsescase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UsescasePostConfigurationResult>> call(
      ParamsUsescasePostConfiguration params) async {
    final result = await repository.postConfiguration(postConfigurationEntity: params.postConfigurationEntity,url: params.url);

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(UsescasePostConfigurationResult(
        result: resp.result,
      )),
    );
  }
}

class ParamsUsescasePostConfiguration {
  final PostConfigurationEntity  postConfigurationEntity ;
  final String url;

  const ParamsUsescasePostConfiguration({required this.postConfigurationEntity ,required this.url});
}

class UsescasePostConfigurationResult {
  
  final ResponsePostConfigurationModel result;

  UsescasePostConfigurationResult({
    required this.result,
  });
}
