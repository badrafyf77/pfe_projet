import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20document%20bloc/check_document_event.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20document%20bloc/check_document_state.dart';


class CheckDocumentBloc extends Bloc<CheckDocumentEvent, CheckDocumentState> {
  final CheckDataRepo _checkDataRepo;

  CheckDocumentBloc(
    this._checkDataRepo,
  ) : super(CheckCinInitial()) {
    on<CheckDocumentEvent>((event, emit) async {
      if (event is CheckDocument) {
        emit(CheckDocumentLoading());
        _checkDataRepo.checkCin(event.base64);
        await Future.delayed(const Duration(seconds: 3), () {});
        emit(CheckDocumentSuccess());
      }
    });
  }
}
