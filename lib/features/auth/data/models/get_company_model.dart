import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/get_company_entity.dart';

class GetCompanyModel extends GetCompanyEntity {
  GetCompanyModel({
    required super.empresa,
    required super.logo,
    required super.nombre,
    required super.resol,
    required super.url,
  });

  factory GetCompanyModel.getCompanyModelFromJson(String str) =>
      GetCompanyModel.fromJson(json.decode(str));

  String getCompanyModelToJson(GetCompanyModel data) =>
      json.encode(data.toJson());

  factory GetCompanyModel.fromJson(Map<String, dynamic> json) =>
      GetCompanyModel(
        url: json["url"] ?? '',
        logo: json["logo"] ?? '',
        nombre: json["nombre"] ?? '',
        empresa: json["empresa"] ?? '',
        resol: json["resol"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "url": url,
        "logo": logo,
        "nombre": nombre,
        "empresa": empresa,
        "resol": resol,
      };

  factory GetCompanyModel.getCompanyEntityToModel(GetCompanyEntity data) =>
      GetCompanyModel.fromJson(data.toJson());
}
