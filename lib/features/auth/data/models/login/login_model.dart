import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/login/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.clave,
    required super.empresa,
    required super.equipoId,
    required super.idioma,
    required super.usuario,
  });

  factory LoginModel.loginModelFromJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String loginModelToJson(LoginModel data) => json.encode(data.toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        usuario: json["usuario"] ?? '',
        clave: json["clave"] ?? '',
        equipoId: json["equipoId"] ?? '',
        empresa: json["empresa"] ?? '',
        idioma: json["idioma"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "clave": clave,
        "equipoId": equipoId,
        "empresa": empresa,
        "idioma": idioma,
      };

  factory LoginModel.loginEntityToModel(LoginEntity data) =>
      LoginModel.fromJson(data.toJson());
}
