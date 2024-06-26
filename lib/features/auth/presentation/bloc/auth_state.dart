part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool showPassword;
  final bool isAuthenticated;
  const AuthState({
    this.showPassword = false,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? showPassword,
    bool? isAuthenticated,
  }) =>
      AuthState(
        showPassword: showPassword ?? this.showPassword,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      );

  @override
  List<Object?> get props => [
        showPassword,
        isAuthenticated,
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
//-----------------------------------/// -----------------------------------/// Class for login State /// -----------------------------------/// -----------------------------------///

class LoadingPostLoginEmailState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedPostLoginEmailState extends AuthState {
  final String error;
  final String message;

  const FailedPostLoginEmailState({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];
}

class PostLoginEmailState extends AuthState {
  final LoginResponseEntity tokenEntity;

  const PostLoginEmailState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [tokenEntity];

  @override
  String toString() {
    return '''
      Get Token: 
        Token: ${tokenEntity.toString()}
    ''';
  }
}

class SuccessPostLoginEmailState extends AuthState {
  final LoginResponseEntity tokenEntity;

  const SuccessPostLoginEmailState({
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
//-----------------------------------/// -----------------------------------/// Class for login State /// -----------------------------------/// -----------------------------------///

class LoadingGetInitialDataState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedGetInitialDataState extends AuthState {
  final String error;
  final String message;

  const FailedGetInitialDataState({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];
}

class GetInitialDataState extends AuthState {
  final InitialDataResponseEntity responseEntity;

  const GetInitialDataState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [responseEntity];

  @override
  String toString() {
    return '''
      Get Token: 
        Token: ${responseEntity.toString()}
    ''';
  }
}

class SuccessGetInitialDataState extends AuthState {
  final InitialDataResponseEntity responseEntity;

  const SuccessGetInitialDataState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

class LogOutUserState extends AuthState {
  final bool result;

  const LogOutUserState({
    required this.result,
  });

  @override
  List<Object?> get props => [result];
}

