class PermissionEntity {
  final String? maeIden;
  final String? usuCodi;

  PermissionEntity({
    this.maeIden,
    this.usuCodi,
  });
  const PermissionEntity.empty()
      : maeIden = '',
        usuCodi = '';

  factory PermissionEntity.fromJson(Map<String, dynamic> json) =>
      PermissionEntity(
        maeIden: json["MAE_IDEN"],
        usuCodi: json["USU_CODI"],
      );

  Map<String, dynamic> toJson() => {
        "MAE_IDEN": maeIden,
        "USU_CODI": usuCodi,
      };
}
