import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/initial_data/configuration_entity.dart';

class ConfigurationModel extends ConfigurationEntity {
  ConfigurationModel({
    required super.parDeci,
    required super.parFcor,
    required super.parHcor,
    required super.parMile,
    required super.parNumd,
    required super.parSepf,
  });

  factory ConfigurationModel.configurationModelFromJson(String str) =>
      ConfigurationModel.fromJson(json.decode(str));

  String configurationModelToJson(ConfigurationModel data) => json.encode(data.toJson());

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => ConfigurationModel(
        parDeci: json["PAR_DECI"] ?? '',
        parNumd: json["PAR_NUMD"] ?? '',
        parMile: json["PAR_MILE"] ?? '',
        parSepf: json["PAR_SEPF"] ?? '',
        parFcor: json["PAR_FCOR"] ?? '',
        parHcor: json["PAR_HCOR"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "PAR_DECI": parDeci,
        "PAR_NUMD": parNumd,
        "PAR_MILE": parMile,
        "PAR_SEPF": parSepf,
        "PAR_FCOR": parFcor,
        "PAR_HCOR": parHcor,
      };

  factory ConfigurationModel.loginEntityToModel(ConfigurationEntity data) =>
      ConfigurationModel.fromJson(data.toJson());
}
