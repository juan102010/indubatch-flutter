import 'package:indubatch_movil/features/auth/data/models/login_model.dart';
import 'package:indubatch_movil/features/auth/data/models/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/response_login_model.dart';

abstract class AuthDatasource {
  Future<List<GetCompanyModel>> getCompany({required String empresa});
  Future<LoginResponseModel> login({required LoginModel loginModel});
}
