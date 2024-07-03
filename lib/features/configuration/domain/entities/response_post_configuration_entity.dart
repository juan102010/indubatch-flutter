import 'dart:convert';

class ResponsePostConfigurationEntity {
  final String msg;
  final int resultado;

  ResponsePostConfigurationEntity({
    required this.msg,
    required this.resultado,
  });
  const ResponsePostConfigurationEntity.empty()
      : msg = '',
        resultado = 0;
  factory ResponsePostConfigurationEntity.fromRawJson(String str) =>
      ResponsePostConfigurationEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponsePostConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ResponsePostConfigurationEntity(
        msg: json["msg"],
        resultado: json["resultado"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "resultado": resultado,
      };
}
