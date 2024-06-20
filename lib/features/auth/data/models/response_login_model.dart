import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/response_login_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    required super.duracion,
    required super.fechaCreacion,
    required super.message,
    required super.status,
    required super.token,
    required super.usuCodigo,
    required super.usuNombre,
  });

  factory LoginResponseModel.loginResponseModelFromJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String loginResponseModelToJson(LoginResponseModel data) =>
      json.encode(data.toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"] ?? '',
        usuNombre: json["usuNombre"] ?? '',
        usuCodigo: json["usuCodigo"] ?? '',
        fechaCreacion: json["fechaCreacion"] ?? '',
        duracion: json["duracion"] ?? '',
        status: json["status"] ?? '',
        message: json["message"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "token": token,
        "usuNombre": usuNombre,
        "usuCodigo": usuCodigo,
        "fechaCreacion": fechaCreacion,
        "duracion": duracion,
        "status": status,
        "message": message,
      };

  factory LoginResponseModel.loginEntityToModel(LoginResponseEntity data) =>
      LoginResponseModel.fromJson(data.toJson());
}
