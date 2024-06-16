import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //define controllers login
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _companyController = BehaviorSubject<String>();

  //get data
  Stream<String> get userStream => _userController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get companyStream => _companyController.stream;

  AuthBloc() : super(const AuthState()) {
    on<ShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(showPassword: event.showPassword)));
  }

  //validation of logion Email
  void updateUser(String user, BuildContext context) async {
    if (user.isEmpty) {
      _userController.sink
          .addError(AppLocalizations.of(context)!.requiredfield);
    } else {
      _userController.sink.add(user);
    }
  }

  void updateCompany(String company, BuildContext context) async {
    if (company.isEmpty) {
      _companyController.sink
          .addError(AppLocalizations.of(context)!.requiredfield);
    } else {
      _companyController.sink.add(company);
    }
  }

  //validation of Password form
  void updatePassword(String password, BuildContext context) {
    if (password.isEmpty) {
      _passwordController.sink
          .addError(AppLocalizations.of(context)!.requiredfield);
    } else {
      _passwordController.sink.add(password);
    }
  }

  //check login validation form
  Stream<bool> get validateLoginForm => Rx.combineLatest3(
        userStream,
        passwordStream,
        companyStream,
        (a, b, c) => true,
      );
}
