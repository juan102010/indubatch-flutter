import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:indubatch_movil/core/network/network_info.dart';
import 'package:indubatch_movil/core/network/server_api_client.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository_impl.dart';
import 'package:indubatch_movil/features/auth/data/datasources/auth_datasource.dart';
import 'package:indubatch_movil/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:indubatch_movil/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:indubatch_movil/features/auth/domain/repositories/auth_repository.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_initial_data_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/get_url_company_usescases.dart';
import 'package:indubatch_movil/features/auth/domain/usescases/post_login_usecase.dart';
import 'package:indubatch_movil/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.pushNewScope();

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(
      getUrlCompanyUsescase: getIt(),
      postLoginUsescase: getIt(),
      getInitialDataUsescase: getIt(),
    ),
  );

  //Server Api Client to Http consume rest apis
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
      localStorageRepository: getIt(),
    ),
  );

  // Use cases
  //Login
  getIt.registerLazySingleton(() => GetUrlCompanyUsescase(repository: getIt()));
  getIt.registerLazySingleton(() => PostLoginUsescase(repository: getIt()));
  getIt
      .registerLazySingleton(() => GetInitialDataUsescase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      localStorageRepository: getIt(),
      authDataSource: getIt(),
      apiClient: getIt(),
    ),
  );

  //Data Source
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(
        apiClient: getIt(),
        localStorageRepository: getIt(),
      ));

  //!Core
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
      () => NetworkInfoRepositoryImpl());

  //! Services

  // local storage actions
  getIt.registerLazySingleton<LocalStorageRepository>(
      () => LocalStorageRepositoryImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Connectivity());
}
