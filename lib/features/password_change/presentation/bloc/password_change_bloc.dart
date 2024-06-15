import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_change_event.dart';
part 'password_change_state.dart';

class PasswordChangeBloc
    extends Bloc<PasswordChangeEvent, PasswordChangeState> {
  //define controllers login

  //get data

  PasswordChangeBloc() : super(const PasswordChangeState());
}
