part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool showPassword;
  const AuthState({
    this.showPassword = false,
  });

  AuthState copyWith({
    bool? showPassword,
  }) =>
      AuthState(
        showPassword: showPassword ?? this.showPassword,
      );

  @override
  List<Object?> get props => [
        showPassword,
      ];
}
// -----------------------------------/// -----------------------------------///GetListCompanies/// -----------------------------------/// -----------------------------------///

class LoadingGetUrlCompanyState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedGetUrlCompanyState extends AuthState {
  final String error;
  final String message;

  const FailedGetUrlCompanyState({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];
}

class GetUrlCompanyState extends AuthState {
  final List<GetCompanyModel> listGetCompanyEntity;

  const GetUrlCompanyState({
    required this.listGetCompanyEntity,
  });

  @override
  List<Object?> get props => [listGetCompanyEntity];

  @override
  String toString() {
    return '''
      Get Permits: 
        Permits: ${listGetCompanyEntity.toString()}
    ''';
  }
}

class SuccessGetUrlCompanyState extends AuthState {
  final List<GetCompanyModel> listGetCompanyEntity;

  const SuccessGetUrlCompanyState({
    required this.listGetCompanyEntity,
  });

  @override
  List<Object?> get props => [];
}


// -----------------------------------/// -----------------------------------///------------------------------- /// -----------------------------------/// -----------------------------------///
