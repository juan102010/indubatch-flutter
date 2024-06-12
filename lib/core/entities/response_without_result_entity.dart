import 'package:equatable/equatable.dart';

import 'message.dart';

/// An entity representing a response without a result.
///
/// The [ResponseWithoutResultEntity] class is immutable and extends [Equatable] to allow
/// value comparison.
class ResponseWithoutResultEntity extends Equatable {
  /// Indicates whether the operation was successful.
  final bool success;

  /// The message response associated with the operation.
  final MessageResponseEntitie messageResponse;

  /// Creates an instance of [ResponseWithoutResultEntity].
  ///
  /// Both [success] and [messageResponse] are required parameters.
  const ResponseWithoutResultEntity({
    required this.success,
    required this.messageResponse,
  });

  /// Creates an empty instance of [ResponseWithoutResultEntity].
  ///
  /// [success] is set to `false`, and [messageResponse] is set to an empty message.
  const ResponseWithoutResultEntity.empty()
      : success = false,
        messageResponse = const MessageResponseEntitie(
          title: "",
          description: "",
          code: '',
        );

  @override
  List<Object?> get props => [
        success,
        messageResponse,
      ];

  @override
  String toString() {
    return ''' 
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    General Response Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      Success: $success,
      Message: ${messageResponse.toString()},
    ''';
  }
}

