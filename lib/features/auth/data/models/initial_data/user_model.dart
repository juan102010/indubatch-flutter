import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/initial_data/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.usuClav,
    required super.usuCodi,
    required super.usuNomb,
    required super.usuTipo,
  });

  factory UserModel.userModelFromJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String userModelToJson(UserModel data) => json.encode(data.toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        usuCodi: json["USU_CODI"] ?? '',
        usuTipo: json["USU_TIPO"] ?? '',
        usuNomb: json["USU_NOMB"] ?? '',
        usuClav: json["USU_CLAV"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "USU_CODI": usuCodi,
        "USU_TIPO": usuTipo,
        "USU_NOMB": usuNomb,
        "USU_CLAV": usuClav,
      };

  factory UserModel.loginEntityToModel(UserEntity data) =>
      UserModel.fromJson(data.toJson());
}
