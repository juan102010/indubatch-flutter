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
