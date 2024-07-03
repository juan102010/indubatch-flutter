part of 'configuration_bloc.dart';

class ConfigurationState extends Equatable {
  const ConfigurationState();

  ConfigurationState copyWith() => const ConfigurationState();

  @override
  List<Object?> get props => [];
}

// ----------------------------------/// ------------------------------- ///Success  /// ------------------------/// -----------------------------------///

class SuccesLoginUrlStorageState extends ConfigurationState {
  final GetCompanyEntity responseEntity;

  const SuccesLoginUrlStorageState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [];
}

class PostLoginUrlEntityStorageState extends ConfigurationState {
  final GetCompanyEntity responseEntity;

  const PostLoginUrlEntityStorageState({
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

// -----------------------------------/// -----------------------------------/// ------------------------------- /// -----------------------------------/// -----------------------------------///
// ----------------------------------/// ------------------------------- ///Success  /// ------------------------/// -----------------------------------///
class LoadingSetServersListSpeedTestState extends ConfigurationState {
  @override
  List<Object?> get props => [];
}

class SuccesSetServersListSpeedTestState extends ConfigurationState {
  final List<Server> responseEntity;

  const SuccesSetServersListSpeedTestState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [];
}

class PostSetServersListSpeedTestState extends ConfigurationState {
  final List<Server> responseEntity;

  const PostSetServersListSpeedTestState({
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

// -----------------------------------/// -----------------------------------/// ------------------------------- /// -----------------------------------/// -----------------------------------///
// ----------------------------------/// ------------------------------- ///Success  /// ------------------------/// -----------------------------------///
class LoadingTestDownloadSpeedState extends ConfigurationState {
  @override
  List<Object?> get props => [];
}

class SuccesTestDownloadSpeedState extends ConfigurationState {
  final double responseEntity;

  const SuccesTestDownloadSpeedState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [];
}

class PostTestDownloadSpeedState extends ConfigurationState {
  final double responseEntity;

  const PostTestDownloadSpeedState({
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

// -----------------------------------/// -----------------------------------/// ------------------------------- /// -----------------------------------/// -----------------------------------///
// ----------------------------------/// ------------------------------- ///Success  /// ------------------------/// -----------------------------------///
class LoadingTestUploadSpeedState extends ConfigurationState {
  @override
  List<Object?> get props => [];
}

class SuccesTestUploadSpeedState extends ConfigurationState {
  final double responseEntity;

  const SuccesTestUploadSpeedState({
    required this.responseEntity,
  });

  @override
  List<Object?> get props => [];
}

class PostTestUploadSpeedState extends ConfigurationState {
  final double responseEntity;

  const PostTestUploadSpeedState({
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
//-----------------------------------/// -----------------------------------/// Class for login State /// -----------------------------------/// -----------------------------------///

class LoadingPostConfigurationState extends ConfigurationState {
  @override
  List<Object?> get props => [];
}

class FailedPostConfigurationState extends ConfigurationState {
  final String error;
  final String message;

  const FailedPostConfigurationState({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];
}

class PostConfigurationState extends ConfigurationState {
  final ResponsePostConfigurationEntity responsePostConfigurationEntity;

  const PostConfigurationState({
    required this.responsePostConfigurationEntity,
  });

  @override
  List<Object?> get props => [responsePostConfigurationEntity];

  @override
  String toString() {
    return '''
      Get Token: 
        Token: ${responsePostConfigurationEntity.toString()}
    ''';
  }
}

class SuccessPostConfigurationState extends ConfigurationState {
  final ResponsePostConfigurationEntity responsePostConfigurationEntity;

  const SuccessPostConfigurationState({
    required this.responsePostConfigurationEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
// -----------------------------------/// -----------------------------------/// ------------------------------- /// -----------------------------------/// -----------------------------------///
