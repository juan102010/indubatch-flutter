import 'package:dartz/dartz.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/post_configuration_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/usescases/post_configuration_usecase.dart';

import '../../../../core/network/failure.dart';

abstract class ConfigurationRepository {
  Future<Either<Failure, UsescasePostConfigurationResult>> postConfiguration(
      {required PostConfigurationEntity postConfigurationEntity,
      required String url});
}
