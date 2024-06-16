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
