import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/utils/constants.dart';
import 'package:indubatch_movil/features/auth/data/models/get_company_model.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //define controllers login
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _companyController = BehaviorSubject<String>();
  final _languageController = BehaviorSubject<String>();
  // Use cases
  final GetUrlCompanyUsescase getUrlCompanyUsescase;
  //get data
  Stream<String> get userStream => _userController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get companyStream => _companyController.stream;
  Stream<String> get languageStream => _languageController.stream;

  AuthBloc({
    required this.getUrlCompanyUsescase,
  }) : super(const AuthState()) {
    on<ShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(showPassword: event.showPassword)));
    on<GetUrlCompanyEvent>((event, emit) async {
      emit(await _getUrlCompany(event: event, emit: emit));
    });
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///

  Future<AuthState> _getUrlCompany({
    required GetUrlCompanyEvent event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingGetUrlCompanyState());

    final user = await getUrlCompanyUsescase(
        ParamsGetUrlCompany(empresa: event.urlCompany));

    return user.fold(
      (failure) {
        emit(
          FailedGetUrlCompanyState(
            error: _mapFailureToMessage(failure),
            message:
                failure.props.isNotEmpty ? failure.props.first.toString() : '',
          ),
        );
        return  const GetUrlCompanyState(
          listGetCompanyEntity:[],
        );
      },
      (response) {
        emit(
          SuccessGetUrlCompanyState(listGetCompanyEntity: response.result),
        );
        return GetUrlCompanyState(listGetCompanyEntity: response.result);
      },
    );
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

  void updateLanguage(String language, BuildContext context) async {
    if (language.isEmpty) {
      _languageController.sink
          .addError(AppLocalizations.of(context)!.requiredfield);
    } else {
      _languageController.sink.add(language);
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
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return Constants.serverFailureMessage;
      case CacheFailure _:
        return Constants.cacheFailureMessage;
      case ConnectionFailure _:
        return Constants.internetFailureMessage;
      case AuthenticationFailure _:
        return Constants.authenticationFailureMessage;
      case ErrorFailure _:
        return Constants.serverFailureMessage;

      default:
        return 'Unexpected error';
    }
  }
}
