import 'dart:convert';

class LoginEntity {
    final String? usuario;
    final String? clave;
    final String? equipoId;
    final String? empresa;
    final String? idioma;

    LoginEntity({
        this.usuario,
        this.clave,
        this.equipoId,
        this.empresa,
        this.idioma,
    });

    factory LoginEntity.fromRawJson(String str) => LoginEntity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        usuario: json["usuario"],
        clave: json["clave"],
        equipoId: json["equipoId"],
        empresa: json["empresa"],
        idioma: json["idioma"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "clave": clave,
        "equipoId": equipoId,
        "empresa": empresa,
        "idioma": idioma,
    };
}
