import 'package:indubatch_movil/features/configuration/data/models/post_configuration_model.dart';
import 'package:indubatch_movil/features/configuration/data/models/response_post_configuration_model.dart';

abstract class ConfigurationDatasource {
  Future<ResponsePostConfigurationModel> postConfiguration(
      {required PostConfigurationModel postConfigurationModel,
      required String url});
}
