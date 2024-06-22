import 'dart:convert';

import 'package:indubatch_movil/core/network/server_api_constants.dart';
import 'package:indubatch_movil/core/network/server_info.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/core/utils/extract_protocol.dart';
import 'package:indubatch_movil/features/auth/data/datasources/auth_datasource.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/response_initial_data_model.dart';
import 'package:indubatch_movil/features/auth/data/models/login/login_model.dart';
import 'package:indubatch_movil/features/auth/data/models/company/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/login/response_login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/company/response_get_company_entity.dart';

import '../../../../core/network/server_api_client.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final ServerApiClient apiClient;
  final LocalStorageRepository localStorageRepository;
  AuthDatasourceImpl(
      {required this.apiClient, required this.localStorageRepository});

  Future<String> _getUrlResult() async {
    GetCompanyEntity? data =
        await localStorageRepository.getSecureUrlInfoStorage();
    print(data.url);
    return ExtractProtocol.removeProtocol(data.url!);
  }

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
    String urlResult = await _getUrlResult();
    final result = await apiClient.post(
        urlResult, ServerApiConstants.postLoginEndpoint, serverSchema,
        body: loginModel.toJson());
    return LoginResponseModel.fromJson(jsonDecode(result.body));
  }

  @override
  Future<InitialDataResponseModel> initialData() async {
    String urlResult = await _getUrlResult();
    final result = await apiClient.get(
      // urlResult,
      'indubatch.bpmco.co',
      ServerApiConstants.getInitialDataEndpoint,
      serverSchema,
    );
    return InitialDataResponseModel.fromJson(jsonDecode(result.body));
  }
}
