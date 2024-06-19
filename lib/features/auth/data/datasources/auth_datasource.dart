import 'package:indubatch_movil/features/auth/data/models/get_company_model.dart';

abstract class AuthDatasource {
  Future<List<GetCompanyModel>> getCompany({required String empresa});
}
