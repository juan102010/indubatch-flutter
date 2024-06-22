import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/initial_data/permission_entity.dart';

class PermissionModel extends PermissionEntity {
  PermissionModel({
    required super.maeIden,
    required super.usuCodi,
  });

  factory PermissionModel.permissionModelFromJson(String str) =>
      PermissionModel.fromJson(json.decode(str));

  String permissionModelToJson(PermissionModel data) =>
      json.encode(data.toJson());

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        maeIden: json["MAE_IDEN"] ?? '',
        usuCodi: json["USU_CODI"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "MAE_IDEN": maeIden,
        "USU_CODI": usuCodi,
      };

  factory PermissionModel.loginEntityToModel(PermissionEntity data) =>
      PermissionModel.fromJson(data.toJson());
}
