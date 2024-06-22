import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/initial_data/documents_demand_entity.dart';

class DocumentsDemandModel extends DocumentsDemandEntity {
  DocumentsDemandModel({
    required super.docCodi,
    required super.docNomb,
    required super.docPaqu,
    required super.docPers,
    required super.docUrlx,
    required super.maeCant,
    required super.maeTcan,
  });

  factory DocumentsDemandModel.documentsDemandModelFromJson(String str) =>
      DocumentsDemandModel.fromJson(json.decode(str));

  String documentsDemandModelToJson(DocumentsDemandModel data) =>
      json.encode(data.toJson());

  factory DocumentsDemandModel.fromJson(Map<String, dynamic> json) =>
      DocumentsDemandModel(
        docCodi: json["DOC_CODI"] ?? '',
        docNomb: json["DOC_NOMB"] ?? '',
        maeCant: json["MAE_CANT"] ?? '',
        maeTcan: json["MAE_TCAN"] ?? '',
        docPers: json["DOC_PERS"] ?? '',
        docUrlx: json["DOC_URLX"] ?? '',
        docPaqu: json["DOC_PAQU"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "DOC_CODI": docCodi,
        "DOC_NOMB": docNomb,
        "MAE_CANT": maeCant,
        "MAE_TCAN": maeTcan,
        "DOC_PERS": docPers,
        "DOC_URLX": docUrlx,
        "DOC_PAQU": docPaqu,
      };

  factory DocumentsDemandModel.loginEntityToModel(DocumentsDemandEntity data) =>
      DocumentsDemandModel.fromJson(data.toJson());
}
