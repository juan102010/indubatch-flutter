import 'dart:convert';
import 'package:indubatch_movil/core/network/server_api_constants.dart';
import 'package:indubatch_movil/core/network/server_info.dart';
import 'package:indubatch_movil/features/configuration/data/datasources/configuration_datasource.dart';
import 'package:indubatch_movil/features/configuration/data/models/post_configuration_model.dart';
import 'package:indubatch_movil/features/configuration/data/models/response_post_configuration_model.dart';

import '../../../../core/network/server_api_client.dart';

class ConfigurationDatasourceImpl implements ConfigurationDatasource {
  final ServerApiClient apiClient;
  ConfigurationDatasourceImpl(
      {required this.apiClient});


  @override
  Future<ResponsePostConfigurationModel> postConfiguration(
      {required PostConfigurationModel postConfigurationModel,
      required String url}) async {
  
    final result = await apiClient.post(
        url, ServerApiConstants.postConfigurationEndpoint, serverSchema,
        body: postConfigurationModel.toJson());
    return ResponsePostConfigurationModel.fromJson(jsonDecode(result.body));
  }
}
