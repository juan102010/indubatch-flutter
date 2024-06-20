import 'dart:convert';

import 'package:indubatch_movil/core/network/server_api_constants.dart';
import 'package:indubatch_movil/core/network/server_info.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/core/utils/extract_protocol.dart';
import 'package:indubatch_movil/features/auth/data/datasources/auth_datasource.dart';
import 'package:indubatch_movil/features/auth/data/models/login_model.dart';
import 'package:indubatch_movil/features/auth/data/models/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/response_login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/response_get_company_entity.dart';

import '../../../../core/network/server_api_client.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final ServerApiClient apiClient;
  final LocalStorageRepository localStorageRepository;
  AuthDatasourceImpl(
      {required this.apiClient, required this.localStorageRepository});

  @override
  Future<List<GetCompanyModel>> getCompany({required String empresa}) async {
    final result = await apiClient.get(
      urlGetCompany,
      ServerApiConstants.getCompanyEndpoint,
      serverSchema,
      queryParameters: {'empresa': empresa},
    );
    List jsonResponse = json.decode(result.body);
    return jsonResponse.map((job) => GetCompanyModel.fromJson(job)).toList();
  }

  @override
  Future<LoginResponseModel> login({required LoginModel loginModel}) async {
    GetCompanyEntity? data;
    data = await localStorageRepository.getSecureUrlInfoStorage();

    String urlResult = ExtractProtocol.removeProtocol(data.url!);
    final result = await apiClient.post(
        urlResult, ServerApiConstants.postLoginEndpoint, serverSchema,
        body: loginModel.toJson());
    return LoginResponseModel.fromJson(jsonDecode(result.body));
  }
}
