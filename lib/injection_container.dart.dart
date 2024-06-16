import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:indubatch_movil/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.pushNewScope();

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(),
  );

  //Server Api Client to Http consume rest apis
  // getIt.registerLazySingleton(
  //   () => ServerApiClient(
  //     networkInfoRepository: getIt(),
  //     getUserInfoUseCase: getIt(),
  //   ),
  // );

  // Use cases
  //Login
  // getIt.registerLazySingleton(() => PostLoginUseCase(repository: getIt()));

  // Repository
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImp(
  //     localStorageRepository: getIt(),
  //     authDataSource: getIt(),
  //     apiClient: getIt(),
  //   ),
  // );

  //Data Source
  // getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(
  //       apiClient: getIt(),
  //     ));

  //!Core
  // Network Handler
  // getIt.registerLazySingleton<NetworkInfoRepository>(
  //     () => NetworkInfoRepositoryImpl());

  //! Services
  // getIt.registerLazySingleton(() => DataBaseService());

  // local storage actions
  // getIt.registerLazySingleton<LocalStorageRepository>(
  //     () => LocalStorageRepositoryImpl());
  // getIt.registerLazySingleton<LocalDatabaseRepository>(
  //     () => LocalDatabaseRepositoryImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Connectivity());
}
