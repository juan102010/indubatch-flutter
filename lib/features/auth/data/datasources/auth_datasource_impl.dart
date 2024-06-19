

import 'dart:convert';

import 'package:indubatch_movil/core/network/server_api_constants.dart';
import 'package:indubatch_movil/core/network/server_info.dart';
import 'package:indubatch_movil/features/auth/data/datasources/auth_datasource.dart';
import 'package:indubatch_movil/features/auth/data/models/get_company_model.dart';

import '../../../../core/network/server_api_client.dart';

/// Implementation of the AuthDatasource interface.
/// This class is responsible for handling the data operations related to authentication.
class AuthDatasourceImpl implements AuthDatasource {
  final ServerApiClient apiClient;

  AuthDatasourceImpl({
    required this.apiClient,
  });

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
  // @override
  // Future<LoginResponseModel> login({required LoginModel loginModel}) async {
  //   final result = await apiClient.post(
  //       serverApiIndubatch, ServerApiConstants.postLoginEndpoint, serverSchema,
  //       body: loginModel.toJson());
  //   return LoginResponseModel.fromMap(jsonDecode(result.body));
  // }
}
