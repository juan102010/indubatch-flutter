class DocumentEntity {
  final String? maeIden;
  final String? usuCodi;
  final String? maeCodi;
  final String? maeNume;
  final dynamic maeCant;
  final String? uniCodi;
  final String? maeFech;
  final String? docCodi;
  final String? docNomb;
  final String? docDesc;
  final String? empCodi;
  final String? plaCodi;
  final String? linIden;
  final String? maeBatc;
  final String? detBatc;
  final String? maeEsta;
  final String? docPers;
  final dynamic docUrlx;
  final String? docPorcen;
  final String? maeAler;
  final String? usuDili;
  final String? proCodi;
  final String? maeLote;
  final String? maeOrde;
  final String? maeVers;
  final String? maeTcan;
  final String? maeDesc;

  DocumentEntity({
    this.maeIden,
    this.usuCodi,
    this.maeCodi,
    this.maeNume,
    this.maeCant,
    this.uniCodi,
    this.maeFech,
    this.docCodi,
    this.docNomb,
    this.docDesc,
    this.empCodi,
    this.plaCodi,
    this.linIden,
    this.maeBatc,
    this.detBatc,
    this.maeEsta,
    this.docPers,
    this.docUrlx,
    this.docPorcen,
    this.maeAler,
    this.usuDili,
    this.proCodi,
    this.maeLote,
    this.maeOrde,
    this.maeVers,
    this.maeTcan,
    this.maeDesc,
  });

  const DocumentEntity.empty()
      : detBatc = '',
        docCodi = '',
        docDesc = '',
        docNomb = '',
        docPers = '',
        docPorcen = '',
        docUrlx = '',
        empCodi = '',
        linIden = '',
        maeAler = '',
        maeBatc = '',
        maeCant = '',
        maeCodi = '',
        maeDesc = '',
        maeEsta = '',
        maeFech = '',
        maeIden = '',
        maeLote = '',
        maeNume = '',
        maeOrde = '',
        maeTcan = '',
        maeVers = '',
        plaCodi = '',
        proCodi = '',
        uniCodi = '',
        usuCodi = '',
        usuDili = '';

  factory DocumentEntity.fromJson(Map<String, dynamic> json) => DocumentEntity(
        maeIden: json["MAE_IDEN"],
        usuCodi: json["USU_CODI"],
        maeCodi: json["MAE_CODI"],
        maeNume: json["MAE_NUME"],
        maeCant: json["MAE_CANT"],
        uniCodi: json["UNI_CODI"],
        maeFech: json["MAE_FECH"],
        docCodi: json["DOC_CODI"],
        docNomb: json["DOC_NOMB"],
        docDesc: json["DOC_DESC"],
        empCodi: json["EMP_CODI"],
        plaCodi: json["PLA_CODI"],
        linIden: json["LIN_IDEN"],
        maeBatc: json["MAE_BATC"],
        detBatc: json["DET_BATC"],
        maeEsta: json["MAE_ESTA"],
        docPers: json["DOC_PERS"],
        docUrlx: json["DOC_URLX"],
        docPorcen: json["DOC_PORCEN"],
        maeAler: json["MAE_ALER"],
        usuDili: json["USU_DILI"],
        proCodi: json["PRO_CODI"],
        maeLote: json["MAE_LOTE"],
        maeOrde: json["MAE_ORDE"],
        maeVers: json["MAE_VERS"],
        maeTcan: json["MAE_TCAN"],
        maeDesc: json["MAE_DESC"],
      );

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
}
