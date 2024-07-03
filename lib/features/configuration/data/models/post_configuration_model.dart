import 'dart:convert';

import 'package:indubatch_movil/features/configuration/domain/entities/post_configuration_entity.dart';

class PostConfigurationModel extends PostConfigurationEntity {
  PostConfigurationModel({
    required super.codigoUsuario,
    required super.idDispositivo,
    required super.modelo,
    required super.nombreUsuario,
    required super.url,
    required super.versionApp,
    required super.versionSo,
  });

  factory PostConfigurationModel.postConfigurationModelFromJson(String str) =>
      PostConfigurationModel.fromJson(json.decode(str));

  String postConfigurationModelToJson(PostConfigurationModel data) =>
      json.encode(data.toJson());

  factory PostConfigurationModel.fromJson(Map<String, dynamic> json) =>
      PostConfigurationModel(
        modelo: json["Modelo"] ?? '',
        versionSo: json["VersionSO"] ?? '',
        versionApp: json["VersionApp"] ?? '',
        idDispositivo: json["IdDispositivo"] ?? '',
        url: json["Url"] ?? '',
        nombreUsuario: json["nombreUsuario"] ?? '',
        codigoUsuario: json["CodigoUsuario"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "Modelo": modelo,
        "VersionSO": versionSo,
        "VersionApp": versionApp,
        "IdDispositivo": idDispositivo,
        "Url": url,
        "nombreUsuario": nombreUsuario,
        "CodigoUsuario": codigoUsuario,
      };

  factory PostConfigurationModel.postConfigurationEntityToModel(PostConfigurationEntity data) =>
      PostConfigurationModel.fromJson(data.toJson());
}
