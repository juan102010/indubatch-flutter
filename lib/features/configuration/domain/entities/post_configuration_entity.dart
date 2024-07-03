import 'dart:convert';

class PostConfigurationEntity {
  final String modelo;
  final String versionSo;
  final String versionApp;
  final String idDispositivo;
  final String url;
  final String nombreUsuario;
  final String codigoUsuario;

  PostConfigurationEntity({
    required this.modelo,
    required this.versionSo,
    required this.versionApp,
    required this.idDispositivo,
    required this.url,
    required this.nombreUsuario,
    required this.codigoUsuario,
  });

  factory PostConfigurationEntity.fromRawJson(String str) =>
      PostConfigurationEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      PostConfigurationEntity(
        modelo: json["Modelo"],
        versionSo: json["VersionSO"],
        versionApp: json["VersionApp"],
        idDispositivo: json["IdDispositivo"],
        url: json["Url"],
        nombreUsuario: json["nombreUsuario"],
        codigoUsuario: json["CodigoUsuario"],
      );

  Map<String, dynamic> toJson() => {
        "Modelo": modelo,
        "VersionSO": versionSo,
        "VersionApp": versionApp,
        "IdDispositivo": idDispositivo,
        "Url": url,
        "nombreUsuario": nombreUsuario,
        "CodigoUsuario": codigoUsuario,
      };
}
