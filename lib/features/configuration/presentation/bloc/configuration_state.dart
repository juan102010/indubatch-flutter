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
