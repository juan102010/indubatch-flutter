import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indubatch_movil/core/network/failure.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/core/utils/constants.dart';
import 'package:indubatch_movil/features/auth/domain/entities/company/response_get_company_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/post_configuration_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/entities/response_post_configuration_entity.dart';
import 'package:indubatch_movil/features/configuration/domain/usescases/post_configuration_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final LocalStorageRepository localStorageRepository;
  final PostConfigurationUsescase postConfigurationUsescase;

  //define controllers Configuration
  final _urlController = BehaviorSubject<String>();
  final _companyController = BehaviorSubject<String>();
  final _languageController = BehaviorSubject<String>();

  //get data
  Stream<String> get urlStream => _urlController.stream;
  Stream<String> get companyStream => _companyController.stream;
  Stream<String> get languageStream => _languageController.stream;

  ConfigurationBloc(
      {required this.localStorageRepository,
      required this.postConfigurationUsescase})
      : super(const ConfigurationState()) {
    on<GetLoginUrlDataEvent>((event, emit) async {
      emit(await _getLoginUrlResponseEntity(event: event, emit: emit));
    });
    on<SetServersListSpeedTestEvent>((event, emit) async {
      emit(await _setServersListSpeedTest(event: event, emit: emit));
    });
    on<TestDownloadSpeedEvent>((event, emit) async {
      emit(await _testDownloadSpeed(event: event, emit: emit));
    });
    on<TestUploadSpeedEvent>((event, emit) async {
      emit(await _testUploadSpeed(event: event, emit: emit));
    });
    on<PostConfigurationEvent>((event, emit) async {
      emit(await _postConfiguration(event: event, emit: emit));
    });
  }

  void updateUrl(String url, BuildContext context) async {
    _urlController.sink.add(url);
  }

  void updateCompany(String company, BuildContext context) async {
    _companyController.sink.add(company);
  }

  void updateLanguage(String language, BuildContext context) async {
    _languageController.sink.add(language);
  }

  Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'serialNumber': build.serialNumber,
      'isLowRamDevice': build.isLowRamDevice,
    };
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<ConfigurationState> _postConfiguration({
    required PostConfigurationEvent event,
    required Emitter<ConfigurationState> emit,
  }) async {
    emit(LoadingPostConfigurationState());

    final user = await postConfigurationUsescase(
        ParamsUsescasePostConfiguration(
            postConfigurationEntity: event.postConfigurationEntity,
            url: event.url));

    return user.fold(
      (failure) {
        emit(FailedPostConfigurationState(
            error: _mapFailureToMessage(failure),
            message: failure.props.isNotEmpty
                ? failure.props.first.toString()
                : ''));

        return const PostConfigurationState(
          responsePostConfigurationEntity: ResponsePostConfigurationEntity.empty(),
        );
      },
      (response) {
        emit(SuccessPostConfigurationState(responsePostConfigurationEntity: response.result));

        return PostConfigurationState(responsePostConfigurationEntity: response.result);
      },
    );
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<ConfigurationState> _setServersListSpeedTest({
    required SetServersListSpeedTestEvent event,
    required Emitter<ConfigurationState> emit,
  }) async {
    emit(LoadingSetServersListSpeedTestState());

    SpeedTestDart tester = SpeedTestDart();

    final settings = await tester.getSettings();
    final servers = settings.servers;

    final bestServersList = await tester.getBestServers(
      servers: servers,
    );
    emit(SuccesSetServersListSpeedTestState(responseEntity: bestServersList));

    return PostSetServersListSpeedTestState(responseEntity: bestServersList);
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<ConfigurationState> _testDownloadSpeed({
    required TestDownloadSpeedEvent event,
    required Emitter<ConfigurationState> emit,
  }) async {
    emit(LoadingTestDownloadSpeedState());
    SpeedTestDart tester = SpeedTestDart();

    final downloadRate = await tester.testDownloadSpeed(servers: event.servers);

    emit(SuccesTestDownloadSpeedState(responseEntity: downloadRate));

    return PostTestDownloadSpeedState(responseEntity: downloadRate);
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  Future<ConfigurationState> _testUploadSpeed({
    required TestUploadSpeedEvent event,
    required Emitter<ConfigurationState> emit,
  }) async {
    emit(LoadingTestUploadSpeedState());
    SpeedTestDart tester = SpeedTestDart();

    final uploadRate = await tester.testUploadSpeed(servers: event.servers);

    emit(SuccesTestUploadSpeedState(responseEntity: uploadRate));

    return PostTestUploadSpeedState(responseEntity: uploadRate);
  }

  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
  //Method to obtain information of user
  Future<ConfigurationState> _getLoginUrlResponseEntity({
    required GetLoginUrlDataEvent event,
    required Emitter<ConfigurationState> emit,
  }) async {
    GetCompanyEntity loginResponseEntity =
        await localStorageRepository.getSecureUrlInfoStorage();

    emit(SuccesLoginUrlStorageState(responseEntity: loginResponseEntity));

    return PostLoginUrlEntityStorageState(responseEntity: loginResponseEntity);
  }

 // -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///
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
