import 'dart:convert';

import 'package:indubatch_movil/features/auth/data/models/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/data/models/response_login_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/response_get_company_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/response_login_entity.dart';

import '../utils/share_preferences_actions.dart';
import 'local_storage_repository.dart';

const _userCredentialsStorageKey = "user_credentials";

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<GetCompanyEntity> getSecureUrlInfoStorage() async {
    String storage = await SharePreferencesAction.getActionFromSecureStorage(
        key: _userCredentialsStorageKey);

    if (storage.isEmpty) {
      return const GetCompanyEntity.empty();
    } else {
      final result = jsonDecode(storage);
      return GetCompanyEntity.fromJson(result);
    }
  }

  @override
  Future<GetCompanyEntity> setSecureUrlInfoStorage(
      {required GetCompanyModel model}) async {
    await SharePreferencesAction.setActionFromSecureStorage(
      key: _userCredentialsStorageKey,
      value: jsonEncode(model.toJson()),
    );
    return model;
  }

  @override
  Future<bool> deleteSecurityStorageUrlInfo() async {
    bool response = false;

    await SharePreferencesAction.deleteActionFromSecureStorage(
        key: _userCredentialsStorageKey);
    response = true;
    return response;
  }
  @override
  Future<LoginResponseEntity> getSecureUserInfoStorage() async {
    String storage = await SharePreferencesAction.getActionFromSecureStorage(
        key: _userCredentialsStorageKey);

    if (storage.isEmpty) {
      return const LoginResponseEntity.empty();
    } else {
      final result = jsonDecode(storage);
      return LoginResponseModel.fromJson(result);
    }
  }

  @override
  Future<LoginResponseEntity> setSecureUserInfoStorage(
      {required LoginResponseModel model}) async {
    await SharePreferencesAction.setActionFromSecureStorage(
      key: _userCredentialsStorageKey,
      value: jsonEncode(model.toJson()),
    );
    return model;
  }

  @override
  Future<bool> deleteSecurityStorageUserInfo() async {
    bool response = false;

    await SharePreferencesAction.deleteActionFromSecureStorage(
        key: _userCredentialsStorageKey);
    response = true;
    return response;
  }
}
