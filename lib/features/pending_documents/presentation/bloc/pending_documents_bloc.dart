import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'pending_documents_event.dart';
part 'pending_documents_state.dart';

class PendingDocumentsBloc extends Bloc<PendingDocumentsEvent, PendingDocumentsState> {
  //define controllers login

  //get data

  PendingDocumentsBloc() : super(const PendingDocumentsState());
}
