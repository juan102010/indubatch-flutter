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
// -----------------------------------///-----------------------------------///Post to login in the app /// -----------------------------------/// -----------------------------------///

class PostLoginEmail extends AuthEvent {
  const PostLoginEmail();

  @override
  List<Object> get props => [];
}

// -----------------------------------///-----------------------------------///Post to login in the app /// -----------------------------------/// -----------------------------------///
class IsAuthenticatedEvent extends AuthEvent {
  final bool isAuthenticated;
  const IsAuthenticatedEvent({required this.isAuthenticated});

  @override
  List<Object?> get props => [isAuthenticated];
}
// -----------------------------------///-----------------------------------///Post to login in the app /// -----------------------------------/// -----------------------------------///

class GetInitialDataEvent extends AuthEvent {
  final String url;

  const GetInitialDataEvent({
    required this.url,
  });

  @override
  List<Object> get props => [];
}
// -----------------------------------///-----------------------------------/// /// -----------------------------------/// -----------------------------------///

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
