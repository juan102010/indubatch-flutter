part of 'configuration_bloc.dart';

abstract class ConfigurationEvent extends Equatable {
  const ConfigurationEvent();
}

// -----------------------------------/// ----------------------------------///Get User local storage /// -----------------------------------/// -----------------------------------///
class GetLoginUrlDataEvent extends ConfigurationEvent {
  @override
  List<Object> get props => [];
}

// -----------------------------------/// -----------------------------------/// ----------------------/// -----------------------------------/// -----------------------------------///
// -----------------------------------/// ----------------------------------///Get User local storage /// -----------------------------------/// -----------------------------------///
class SetServersListSpeedTestEvent extends ConfigurationEvent {
  @override
  List<Object> get props => [];
}

// -----------------------------------/// -----------------------------------/// ----------------------/// -----------------------------------/// -----------------------------------///
// -----------------------------------/// ----------------------------------///Get User local storage /// -----------------------------------/// -----------------------------------///
class TestDownloadSpeedEvent extends ConfigurationEvent {
  final List<Server> servers;
  const TestDownloadSpeedEvent({
    required this.servers,
  });
  @override
  List<Object> get props => [];
}

// -----------------------------------/// -----------------------------------/// ----------------------/// -----------------------------------/// -----------------------------------///
// -----------------------------------/// ----------------------------------///Get User local storage /// -----------------------------------/// -----------------------------------///
class TestUploadSpeedEvent extends ConfigurationEvent {
  final List<Server> servers;
  const TestUploadSpeedEvent({
    required this.servers,
  });
  @override
  List<Object> get props => [];
}

// -----------------------------------///-----------------------------------///Post to login in the app /// -----------------------------------/// -----------------------------------///
class PostConfigurationEvent extends ConfigurationEvent {
  final PostConfigurationEntity postConfigurationEntity;
  final String url;
  const PostConfigurationEvent(
      {required this.postConfigurationEntity, required this.url});

  @override
  List<Object?> get props => [postConfigurationEntity, url];
}
// -----------------------------------/// -----------------------------------/// ----------------------/// -----------------------------------/// -----------------------------------///
