class UserEntity {
  final String? usuCodi;
  final String? usuTipo;
  final String? usuNomb;
  final String? usuClav;

  UserEntity({
    this.usuCodi,
    this.usuTipo,
    this.usuNomb,
    this.usuClav,
  });
  const UserEntity.empty()
      : usuClav = '',
        usuCodi = '',
        usuNomb = '',
        usuTipo = '';

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        usuCodi: json["USU_CODI"],
        usuTipo: json["USU_TIPO"],
        usuNomb: json["USU_NOMB"],
        usuClav: json["USU_CLAV"],
      );

  Map<String, dynamic> toJson() => {
        "USU_CODI": usuCodi,
        "USU_TIPO": usuTipo,
        "USU_NOMB": usuNomb,
        "USU_CLAV": usuClav,
      };
}
