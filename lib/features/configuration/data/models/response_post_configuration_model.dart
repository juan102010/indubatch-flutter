import 'dart:convert';

import 'package:indubatch_movil/features/configuration/domain/entities/response_post_configuration_entity.dart';

class ResponsePostConfigurationModel extends ResponsePostConfigurationEntity {
  ResponsePostConfigurationModel({
    required super.msg,
    required super.resultado,
  });

  factory ResponsePostConfigurationModel.responsePostConfigurationModelFromJson(
          String str) =>
      ResponsePostConfigurationModel.fromJson(json.decode(str));

  String responsePostConfigurationModelToJson(
          ResponsePostConfigurationModel data) =>
      json.encode(data.toJson());

  factory ResponsePostConfigurationModel.fromJson(Map<String, dynamic> json) =>
      ResponsePostConfigurationModel(
        msg: json["msg"] ?? '',
        resultado: json["resultado"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "msg": msg,
        "resultado": resultado,
      };

  factory ResponsePostConfigurationModel.responsePostConfigurationEntityToModel(
          ResponsePostConfigurationEntity data) =>
      ResponsePostConfigurationModel.fromJson(data.toJson());
}
