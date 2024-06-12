

import 'package:indubatch_movil/core/entities/message.dart';

/// # Documentación de la clase MessageResponseModel
///
/// ## Descripción
///
/// Esta clase representa un modelo de respuesta de mensaje que extiende la entidad de respuesta de mensaje base.
///
/// ## Clase: `MessageResponseModel`

class MessageResponseModel extends MessageResponseEntitie {
  const MessageResponseModel({
    required super.title,
    required super.description,
    required super.code,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "code": code,
    };
  }

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        code: json['description'] ?? '');
  }
}
