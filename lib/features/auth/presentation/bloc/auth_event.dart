part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ShowPasswordEvent extends AuthEvent {
  final bool showPassword;

  const ShowPasswordEvent(this.showPassword);
  @override
  List<Object?> get props => [];
}
