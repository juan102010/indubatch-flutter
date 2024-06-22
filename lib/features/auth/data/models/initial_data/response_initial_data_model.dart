import 'dart:convert';

import 'package:indubatch_movil/features/auth/data/models/initial_data/configuration_model.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/document_model.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/documents_demand_model.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/permission_model.dart';
import 'package:indubatch_movil/features/auth/data/models/initial_data/user_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/response_initial_data_entity.dart';

class InitialDataResponseModel extends InitialDataResponseEntity {
  InitialDataResponseModel({
    required super.configuracion,
    required super.documentos,
    required super.documentosDemanda,
    required super.documentosDemandaPermisos,
    required super.documentosFinalizados,
    required super.permisos,
    required super.usuarios,
  });

  factory InitialDataResponseModel.initialDataResponseModelFromJson(
          String str) =>
      InitialDataResponseModel.fromJson(json.decode(str));

  String initialDataResponseModelToJson(InitialDataResponseModel data) =>
      json.encode(data.toJson());

  factory InitialDataResponseModel.fromJson(Map<String, dynamic> json) =>
      InitialDataResponseModel(
        configuracion: json["configuracion"] == null
            ? null
            : ConfigurationModel.fromJson(json["configuracion"]),
        documentos: json["documentos"] == null
            ? []
            : List<DocumentModel>.from(
                json["documentos"]!.map((x) => DocumentModel.fromJson(x))),
        documentosFinalizados: json["documentosFinalizados"] == null
            ? []
            : List<dynamic>.from(json["documentosFinalizados"]!.map((x) => x)),
        permisos: json["permisos"] == null
            ? []
            : List<PermissionModel>.from(
                json["permisos"]!.map((x) => PermissionModel.fromJson(x))),
        usuarios: json["usuarios"] == null
            ? []
            : List<UserModel>.from(
                json["usuarios"]!.map((x) => UserModel.fromJson(x))),
        documentosDemanda: json["documentosDemanda"] == null
            ? []
            : List<DocumentsDemandModel>.from(json["documentosDemanda"]!
                .map((x) => DocumentsDemandModel.fromJson(x))),
        documentosDemandaPermisos: json["documentosDemandaPermisos"] == null
            ? []
            : List<PermissionModel>.from(json["documentosDemandaPermisos"]!
                .map((x) => PermissionModel.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "configuracion": configuracion!.toJson(),
        "documentos": List<dynamic>.from(documentos!.map((x) => x.toJson())),
        "documentosFinalizados":
            List<dynamic>.from(documentosFinalizados!.map((x) => x)),
        "permisos": List<dynamic>.from(permisos!.map((x) => x.toJson())),
        "usuarios": List<dynamic>.from(usuarios!.map((x) => x.toJson())),
        "documentosDemanda":
            List<dynamic>.from(documentosDemanda!.map((x) => x.toJson())),
        "documentosDemandaPermisos": List<dynamic>.from(
            documentosDemandaPermisos!.map((x) => x.toJson())),
      };

  factory InitialDataResponseModel.getCompanyEntityToModel(
          InitialDataResponseEntity data) =>
      InitialDataResponseModel.fromJson(data.toJson());
}
