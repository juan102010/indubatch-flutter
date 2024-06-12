import 'package:indubatch_movil/core/entities/response_without_result_entity.dart';

import 'message.dart';

/// # Documentación de la clase ResponseWithoutResultModel
///
/// ## Descripción
///
/// Esta clase representa un modelo de respuesta sin resultado que extiende la entidad de respuesta sin resultado base.
///
/// ## Clase: `ResponseWithoutResultModel`
class ResponseWithoutResultModel extends ResponseWithoutResultEntity {
  const ResponseWithoutResultModel({
    required super.success,
    required super.messageResponse,
  });
  //

  factory ResponseWithoutResultModel.fromJson(Map<String, dynamic> json) {
    MessageResponseModel messageResponseModel = MessageResponseModel(
      title: json["message"],
      description: json["message"],
      code: json["code"],
    );

    return ResponseWithoutResultModel(
      success: (json['success'] ?? false) as bool,
      messageResponse: messageResponseModel,
    );
  }
}
