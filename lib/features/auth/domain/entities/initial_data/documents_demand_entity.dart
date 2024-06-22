class DocumentsDemandEntity {
  final String? docCodi;
  final String? docNomb;
  final dynamic maeCant;
  final String? maeTcan;
  final String? docPers;
  final dynamic docUrlx;
  final String? docPaqu;

  DocumentsDemandEntity({
    this.docCodi,
    this.docNomb,
    this.maeCant,
    this.maeTcan,
    this.docPers,
    this.docUrlx,
    this.docPaqu,
  });
  const DocumentsDemandEntity.empty()
      : docCodi = '',
        docNomb = '',
        docPaqu = '',
        docPers = '',
        docUrlx = '',
        maeCant = '',
        maeTcan = '';

  factory DocumentsDemandEntity.fromJson(Map<String, dynamic> json) =>
      DocumentsDemandEntity(
        docCodi: json["DOC_CODI"],
        docNomb: json["DOC_NOMB"],
        maeCant: json["MAE_CANT"],
        maeTcan: json["MAE_TCAN"],
        docPers: json["DOC_PERS"],
        docUrlx: json["DOC_URLX"],
        docPaqu: json["DOC_PAQU"],
      );

  Map<String, dynamic> toJson() => {
        "DOC_CODI": docCodi,
        "DOC_NOMB": docNomb,
        "MAE_CANT": maeCant,
        "MAE_TCAN": maeTcan,
        "DOC_PERS": docPers,
        "DOC_URLX": docUrlx,
        "DOC_PAQU": docPaqu,
      };
}
