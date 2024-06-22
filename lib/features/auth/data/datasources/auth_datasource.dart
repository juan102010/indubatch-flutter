import 'package:indubatch_movil/features/auth/data/models/initial_data/response_initial_data_model.dart';
import 'package:indubatch_movil/features/auth/data/models/login/login_model.dart';
import 'package:indubatch_movil/features/auth/data/models/company/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/login/response_login_model.dart';

abstract class AuthDatasource {
  Future<List<GetCompanyModel>> getCompany({required String empresa});
  Future<LoginResponseModel> login({required LoginModel loginModel});
  Future<InitialDataResponseModel> initialData();
}
