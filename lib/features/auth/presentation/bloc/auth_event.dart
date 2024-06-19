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
// -----------------------------------/// ---------------------------------/// Creation of pdf event /// -------------------------------------/// ------------------------------------///

class GetUrlCompanyEvent extends AuthEvent {
  final String urlCompany;

  const GetUrlCompanyEvent({
    required this.urlCompany,
  });

  @override
  List<Object> get props => [urlCompany];
}
