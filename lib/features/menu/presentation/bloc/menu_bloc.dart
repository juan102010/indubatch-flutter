import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc()
      : super(const MenuState(
          closeSession: false,
          isShowingLogOutDialog: false,
        )) {
    on<CloseSessionEvent>((event, emit) {
      emit(
        state.copyWith(
          closeSession: true,
        ),
      );
    });
    on<OpenShowGuestDialogEvent>((event, emit) {
      emit(
        state.copyWith(
          isShowingGuestDialog: true,
        ),
      );
    });
    on<CloseShowGuestDialogEvent>((event, emit) {
      emit(
        state.copyWith(
          isShowingGuestDialog: false,
        ),
      );
    });
    on<OpenShowLogOutDialogEvent>((event, emit) {
      emit(
        state.copyWith(
          isShowingLogOutDialog: true,
        ),
      );
    });
    on<CloseShowLogOutDialogEvent>((event, emit) {
      emit(
        state.copyWith(
          isShowingLogOutDialog: false,
        ),
      );
    });
  }
}
