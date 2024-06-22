class ConfigurationEntity {
  final String? parDeci;
  final String? parNumd;
  final String? parMile;
  final String? parSepf;
  final String? parFcor;
  final String? parHcor;

  ConfigurationEntity({
    this.parDeci,
    this.parNumd,
    this.parMile,
    this.parSepf,
    this.parFcor,
    this.parHcor,
  });
  const ConfigurationEntity.empty()
      : parDeci = '',
        parFcor = '',
        parHcor = '',
        parMile = '',
        parNumd = '',
        parSepf = '';

  factory ConfigurationEntity.fromJson(Map<String, dynamic> json) =>
      ConfigurationEntity(
        parDeci: json["PAR_DECI"],
        parNumd: json["PAR_NUMD"],
        parMile: json["PAR_MILE"],
        parSepf: json["PAR_SEPF"],
        parFcor: json["PAR_FCOR"],
        parHcor: json["PAR_HCOR"],
      );

  Map<String, dynamic> toJson() => {
        "PAR_DECI": parDeci,
        "PAR_NUMD": parNumd,
        "PAR_MILE": parMile,
        "PAR_SEPF": parSepf,
        "PAR_FCOR": parFcor,
        "PAR_HCOR": parHcor,
      };
}
