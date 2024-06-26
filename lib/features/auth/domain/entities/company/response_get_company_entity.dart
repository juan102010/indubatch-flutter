class GetCompanyEntity {
  final String url;
  final String? logo;
  final String? nombre;
  final String? empresa;
  final int? resol;

  GetCompanyEntity({
    required this.url,
    this.logo,
    this.nombre,
    this.empresa,
    this.resol,
  });

  const GetCompanyEntity.empty()
      : empresa = '',
        logo = '',
        nombre = '',
        resol = 0,
        url = '';

  factory GetCompanyEntity.fromJson(Map<String, dynamic> json) =>
      GetCompanyEntity(
        url: json["url"],
        logo: json["logo"],
        nombre: json["nombre"],
        empresa: json["empresa"],
        resol: json["resol"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "logo": logo,
        "nombre": nombre,
        "empresa": empresa,
        "resol": resol,
      };
}
