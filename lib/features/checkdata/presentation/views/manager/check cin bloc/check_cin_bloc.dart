// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

part 'check_cin_event.dart';
part 'check_cin_state.dart';

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
