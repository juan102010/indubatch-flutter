class GetInformationEntity {
  final String? model;
  final String? product;
  final String? versionRelease;
  final String? versionSdkInt;
  final String? id;

  GetInformationEntity({
    this.model,
    this.product,
    this.versionRelease,
    this.versionSdkInt,
    this.id,
  });
  const GetInformationEntity.empty()
      : model = '',
        product = '',
        versionRelease = '',
        versionSdkInt = '',
        id = '';
}
