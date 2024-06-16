import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //define controllers login
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //get data
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  AuthBloc() : super(const AuthState());

  //validation of logion Email
  void updateEmail(String userEmail, BuildContext context) async {
    if (userEmail.isEmpty) {
      _emailController.sink
          .addError(AppLocalizations.of(context)!.requiredfield);
    } else {
      _emailController.sink.add(userEmail);
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
  Stream<bool> get validateLoginForm => Rx.combineLatest2(
        emailStream,
        passwordStream,
        (a, b) => true,
      );
}
