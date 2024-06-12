import 'package:equatable/equatable.dart';

/// An entity representing a message response.
///
/// The [MessageResponseEntitie] class is immutable and extends [Equatable] to allow
/// value comparison.
class MessageResponseEntitie extends Equatable {
  /// The title of the message.
  final String title;

  /// The description of the message.
  final String description;

  /// The code associated with the message.
  final String code;

  /// Creates an instance of [MessageResponseEntitie].
  ///
  /// All parameters [title], [description], and [code] are required.
  const MessageResponseEntitie({
    required this.title,
    required this.description,
    required this.code,
  });

  /// Creates an empty instance of [MessageResponseEntitie].
  ///
  /// All properties are set to empty strings.
  const MessageResponseEntitie.empty()
      : title = "",
        description = "",
        code = '';

  @override
  List<Object?> get props => [
        title,
        description,
        code,
      ];

  @override
  String toString() {
    return ''' 
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    Message Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      Title: $title,
      Description: $description,
      Code: $code,
    ''';
  }
}
