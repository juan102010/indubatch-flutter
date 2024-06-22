import 'package:indubatch_movil/features/auth/data/models/company/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/login/response_login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/company/response_get_company_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/response_login_entity.dart';

abstract class LocalStorageRepository {
  Future<GetCompanyEntity> getSecureUrlInfoStorage();
  Future<GetCompanyEntity> setSecureUrlInfoStorage({
    required GetCompanyModel model,
  });
  Future<bool> deleteSecurityStorageUrlInfo();
  Future<LoginResponseEntity> getSecureUserInfoStorage();
  Future<LoginResponseEntity> setSecureUserInfoStorage({
    required LoginResponseModel model,
  });
  Future<bool> deleteSecurityStorageUserInfo();
}
