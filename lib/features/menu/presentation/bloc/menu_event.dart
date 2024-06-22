part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
}

class CloseSessionEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}

class OpenShowLogOutDialogEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}

class CloseShowLogOutDialogEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}

class OpenShowGuestDialogEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}

class CloseShowGuestDialogEvent extends MenuEvent {
  @override
  List<Object?> get props => [];
}
