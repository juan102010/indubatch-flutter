import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/core/utils/constants.dart';
import 'package:indubatch_movil/features/auth/data/models/company/response_get_company_model.dart';
import 'package:indubatch_movil/features/auth/domain/entities/company/response_get_company_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/initial_data/response_initial_data_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/response_login_entity.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_initial_data_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/post_login_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Use cases
  final GetUrlCompanyUsescase getUrlCompanyUsescase;
  final PostLoginUsescase postLoginUsescase;
  final GetInitialDataUsescase getInitialDataUsescase;
  // Implementation local storage
  final LocalStorageRepository localStorageRepository;
  //define controllers login
  final _userController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _companyController = BehaviorSubject<String>();
  final _languageController = BehaviorSubject<String>();
  //get data
  Stream<String> get userStream => _userController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get companyStream => _companyController.stream;
  Stream<String> get languageStream => _languageController.stream;

  AuthBloc({
    required this.getUrlCompanyUsescase,
    required this.postLoginUsescase,
    required this.getInitialDataUsescase,
    required this.localStorageRepository,
  }) : super(const AuthState()) {
    on<ShowPasswordEvent>((event, emit) =>
        emit(state.copyWith(showPassword: event.showPassword)));
    on<GetUrlCompanyEvent>((event, emit) async {
      emit(await _getUrlCompany(event: event, emit: emit));
    });
    on<PostLoginEmail>((event, emit) async {
      emit(await _postLogin(event: event, emit: emit));
    });
    on<GetInitialDataEvent>((event, emit) async {
      emit(await _getInitalData(event: event, emit: emit));
    });
    on<LogOutUserEvent>((event, emit) async {
      emit(await _logOutApp());
    });
  }
  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<AuthState> _logOutApp() async {
    bool response = false;
    response = await localStorageRepository.deleteSecurityStorageUserInfo();

    return LogOutUserState(result: response);
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<AuthState> _postLogin({
    required PostLoginEmail event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingPostLoginEmailState());

    LoginEntity loginEntity = await _setEditCategoriesEntity();

    final user = await postLoginUsescase(
        ParamsUsescasePostLogin(loginEntity: loginEntity));

    return user.fold(
      (failure) {
        emit(FailedPostLoginEmailState(
            error: _mapFailureToMessage(failure),
            message: failure.props.isNotEmpty
                ? failure.props.first.toString()
                : ''));

        return const PostLoginEmailState(
          tokenEntity: LoginResponseEntity.empty(),
        );
      },
      (response) {
        emit(SuccessPostLoginEmailState(tokenEntity: response.result));

        return PostLoginEmailState(tokenEntity: response.result);
      },
    );
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<AuthState> _getInitalData({
    required GetInitialDataEvent event,
    required Emitter<AuthState> emit,
  }) async {
    emit(LoadingGetInitialDataState());

    final initialData =
        await getInitialDataUsescase(ParamsGetInitialData(url: event.url));

    return initialData.fold(
      (failure) {
        emit(FailedGetInitialDataState(
            error: _mapFailureToMessage(failure),
            message: failure.props.isNotEmpty
                ? failure.props.first.toString()
                : ''));

        return GetInitialDataState(
          responseEntity: InitialDataResponseEntity.empty(),
        );
      },
      (response) {
        emit(SuccessGetInitialDataState(responseEntity: response.result));

        return GetInitialDataState(responseEntity: response.result);
      },
    );
  }
// -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///

  Future<GetCompanyEntity> getCompany() async {
    GetCompanyEntity result = const GetCompanyEntity.empty();

    result = await localStorageRepository.getSecureUrlInfoStorage();

    if (result.url!.isNotEmpty) {
      result = result;
    }
    return result;
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  //Method to assign the values that are in the Strim to the category entity.
  Future<LoginEntity> _setEditCategoriesEntity() async {
    LoginEntity loginEntity = LoginEntity(
        clave: await passwordStream.first,
        empresa: await companyStream.first,
        //TODO se requiere que sea dinamico
        equipoId: '0DB38950-4736-475B-97E0-39C2C272DF9D',
        //TODO se requiere que sea dinamico
        idioma: '1',
        usuario: await userStream.first);
    return loginEntity;
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
        return const GetUrlCompanyState(
          listGetCompanyEntity: [],
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
