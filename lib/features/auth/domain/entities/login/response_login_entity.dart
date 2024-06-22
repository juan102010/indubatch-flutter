class LoginResponseEntity {
  final String? token;
  final String? usuNombre;
  final String? usuCodigo;
  final String? fechaCreacion;
  final String? duracion;
  final String? status;
  final String? message;

  LoginResponseEntity({
    this.token,
    this.usuNombre,
    this.usuCodigo,
    this.fechaCreacion,
    this.duracion,
    this.status,
    this.message,
  });
  const LoginResponseEntity.empty()
      : token = '',
        message = '',
        usuNombre = '',
        duracion = '',
        fechaCreacion = '',
        status = '',
        usuCodigo = '';

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      LoginResponseEntity(
        token: json["token"],
        usuNombre: json["usuNombre"],
        usuCodigo: json["usuCodigo"],
        fechaCreacion: json["fechaCreacion"],
        duracion: json["duracion"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "usuNombre": usuNombre,
        "usuCodigo": usuCodigo,
        "fechaCreacion": fechaCreacion,
        "duracion": duracion,
        "status": status,
        "message": message,
      };
}
