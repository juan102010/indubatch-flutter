import 'dart:convert';

import 'package:indubatch_movil/features/auth/domain/entities/initial_data/document_entity.dart';

class DocumentModel extends DocumentEntity {
  DocumentModel({
    required super.detBatc,
    required super.usuCodi,
    required super.docCodi,
    required super.docDesc,
    required super.docNomb,
    required super.docPers,
    required super.docPorcen,
    required super.docUrlx,
    required super.empCodi,
    required super.linIden,
    required super.maeBatc,
    required super.maeCant,
    required super.maeAler,
    required super.maeCodi,
    required super.maeDesc,
    required super.maeEsta,
    required super.maeFech,
    required super.maeIden,
    required super.maeLote,
    required super.maeNume,
    required super.maeOrde,
    required super.maeTcan,
    required super.maeVers,
    required super.plaCodi,
    required super.proCodi,
    required super.uniCodi,
    required super.usuDili,
  });

  factory DocumentModel.documentModelFromJson(String str) =>
      DocumentModel.fromJson(json.decode(str));

  String documentModelToJson(DocumentModel data) => json.encode(data.toJson());

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        maeIden: json["MAE_IDEN"] ?? '',
        usuCodi: json["USU_CODI"] ?? '',
        maeCodi: json["MAE_CODI"] ?? '',
        maeNume: json["MAE_NUME"] ?? '',
        maeCant: json["MAE_CANT"] ?? '',
        uniCodi: json["UNI_CODI"] ?? '',
        maeFech: json["MAE_FECH"] ?? '',
        docCodi: json["DOC_CODI"] ?? '',
        docNomb: json["DOC_NOMB"] ?? '',
        docDesc: json["DOC_DESC"] ?? '',
        empCodi: json["EMP_CODI"] ?? '',
        plaCodi: json["PLA_CODI"] ?? '',
        linIden: json["LIN_IDEN"] ?? '',
        maeBatc: json["MAE_BATC"] ?? '',
        detBatc: json["DET_BATC"] ?? '',
        maeEsta: json["MAE_ESTA"] ?? '',
        docPers: json["DOC_PERS"] ?? '',
        docUrlx: json["DOC_URLX"] ?? '',
        docPorcen: json["DOC_PORCEN"] ?? '',
        maeAler: json["MAE_ALER"] ?? '',
        usuDili: json["USU_DILI"] ?? '',
        proCodi: json["PRO_CODI"] ?? '',
        maeLote: json["MAE_LOTE"] ?? '',
        maeOrde: json["MAE_ORDE"] ?? '',
        maeVers: json["MAE_VERS"] ?? '',
        maeTcan: json["MAE_TCAN"] ?? '',
        maeDesc: json["MAE_DESC"] ?? '',
      );

  @override
  Map<String, dynamic> toJson() => {
        "MAE_IDEN": maeIden,
        "USU_CODI": usuCodi,
        "MAE_CODI": maeCodi,
        "MAE_NUME": maeNume,
        "MAE_CANT": maeCant,
        "UNI_CODI": uniCodi,
        "MAE_FECH": maeFech,
        "DOC_CODI": docCodi,
        "DOC_NOMB": docNomb,
        "DOC_DESC": docDesc,
        "EMP_CODI": empCodi,
        "PLA_CODI": plaCodi,
        "LIN_IDEN": linIden,
        "MAE_BATC": maeBatc,
        "DET_BATC": detBatc,
        "MAE_ESTA": maeEsta,
        "DOC_PERS": docPers,
        "DOC_URLX": docUrlx,
        "DOC_PORCEN": docPorcen,
        "MAE_ALER": maeAler,
        "USU_DILI": usuDili,
        "PRO_CODI": proCodi,
        "MAE_LOTE": maeLote,
        "MAE_ORDE": maeOrde,
        "MAE_VERS": maeVers,
        "MAE_TCAN": maeTcan,
        "MAE_DESC": maeDesc,
      };

  factory DocumentModel.loginEntityToModel(DocumentEntity data) =>
      DocumentModel.fromJson(data.toJson());
}
