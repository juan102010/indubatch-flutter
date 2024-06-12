// import 'dart:convert';

// import '../utils/share_preferences_actions.dart';
// import 'local_storage_repository.dart';

// const _userCredentialsStorageKey = "user_credentials";

// class LocalStorageRepositoryImpl extends LocalStorageRepository {
//   @override
//   Future<LoginResponseEntity> getSecureUserInfoStorage() async {
//     String storage = await SharePreferencesAction.getActionFromSecureStorage(
//         key: _userCredentialsStorageKey);

//     if (storage.isEmpty) {
//       return const LoginResponseEntity.empty();
//     } else {
//       final result = jsonDecode(storage);
//       return LoginResponseModel.fromJson(result);
//     }
//   }

//   @override
//   Future<LoginResponseEntity> setSecureUserInfoStorage(
//       {required LoginResponseModel model}) async {
//     await SharePreferencesAction.setActionFromSecureStorage(
//       key: _userCredentialsStorageKey,
//       value: jsonEncode(model.toJson()),
//     );
//     return model;
//   }

//   @override
//   Future<bool> deleteSecurityStorageUserInfo() async {
//     bool response = false;

//     await SharePreferencesAction.deleteActionFromSecureStorage(
//         key: _userCredentialsStorageKey);
//     response = true;
//     return response;
//   }
// }
