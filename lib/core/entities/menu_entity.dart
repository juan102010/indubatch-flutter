import 'package:equatable/equatable.dart';

/// An entity representing a menu item.
///
/// The [MenuTopEntitie] class is immutable and extends [Equatable] to allow
/// value comparison.
class MenuTopEntitie extends Equatable {
  /// The title of the menu item.
  final String title;

  /// The route associated with the menu item.
  final String rute;

  /// Creates an instance of [MenuTopEntitie].
  ///
  /// Both [title] and [rute] are required parameters.
  const MenuTopEntitie({
    required this.title,
    required this.rute,
  });

  /// Creates an empty instance of [MenuTopEntitie].
  ///
  /// Both [title] and [rute] are set to empty strings.
  const MenuTopEntitie.empty()
      : title = "",
        rute = "";

  @override
  List<Object?> get props => [
        title,
        rute,
      ];
}
