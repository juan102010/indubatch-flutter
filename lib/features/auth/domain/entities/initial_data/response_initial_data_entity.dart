import 'package:indubatch_movil/features/auth/domain/entities/initial_data/configuration_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/document_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/documents_demand_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/permission_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/user_entity.dart';

class InitialDataResponseEntity {
  final ConfigurationEntity? configuracion;
  final List<DocumentEntity>? documentos;
  //TODO preguntar por este cuerpo
  final List<dynamic>? documentosFinalizados;
  final List<PermissionEntity>? permisos;
  final List<UserEntity>? usuarios;
  final List<DocumentsDemandEntity>? documentosDemanda;
  final List<PermissionEntity>? documentosDemandaPermisos;

  InitialDataResponseEntity({
    this.configuracion,
    this.documentos,
    this.documentosFinalizados,
    this.permisos,
    this.usuarios,
    this.documentosDemanda,
    this.documentosDemandaPermisos,
  });

  InitialDataResponseEntity.empty()
      : configuracion = const ConfigurationEntity.empty(),
        documentos = [],
        documentosDemanda = [],
        documentosDemandaPermisos = [],
        documentosFinalizados = [],
        permisos = [],
        usuarios = [];

  factory InitialDataResponseEntity.fromJson(Map<String, dynamic> json) =>
      InitialDataResponseEntity(
        configuracion: json["configuracion"] == null
            ? null
            : ConfigurationEntity.fromJson(json["configuracion"]),
        documentos: json["documentos"] == null
            ? []
            : List<DocumentEntity>.from(
                json["documentos"]!.map((x) => DocumentEntity.fromJson(x))),
        documentosFinalizados: json["documentosFinalizados"] == null
            ? []
            : List<dynamic>.from(json["documentosFinalizados"]!.map((x) => x)),
        permisos: json["permisos"] == null
            ? []
            : List<PermissionEntity>.from(
                json["permisos"]!.map((x) => PermissionEntity.fromJson(x))),
        usuarios: json["usuarios"] == null
            ? []
            : List<UserEntity>.from(
                json["usuarios"]!.map((x) => UserEntity.fromJson(x))),
        documentosDemanda: json["documentosDemanda"] == null
            ? []
            : List<DocumentsDemandEntity>.from(json["documentosDemanda"]!
                .map((x) => DocumentsDemandEntity.fromJson(x))),
        documentosDemandaPermisos: json["documentosDemandaPermisos"] == null
            ? []
            : List<PermissionEntity>.from(json["documentosDemandaPermisos"]!
                .map((x) => PermissionEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "configuracion": configuracion?.toJson(),
        "documentos": documentos == null
            ? []
            : List<dynamic>.from(documentos!.map((x) => x.toJson())),
        "documentosFinalizados": documentosFinalizados == null
            ? []
            : List<dynamic>.from(documentosFinalizados!.map((x) => x)),
        "permisos": permisos == null
            ? []
            : List<dynamic>.from(permisos!.map((x) => x.toJson())),
        "usuarios": usuarios == null
            ? []
            : List<dynamic>.from(usuarios!.map((x) => x.toJson())),
        "documentosDemanda": documentosDemanda == null
            ? []
            : List<dynamic>.from(documentosDemanda!.map((x) => x.toJson())),
        "documentosDemandaPermisos": documentosDemandaPermisos == null
            ? []
            : List<dynamic>.from(
                documentosDemandaPermisos!.map((x) => x.toJson())),
      };
}
