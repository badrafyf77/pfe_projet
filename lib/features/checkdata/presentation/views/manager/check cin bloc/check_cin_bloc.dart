// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

part 'check_cin_event.dart';
part 'check_cin_state.dart';

class CheckCinBloc extends Bloc<CheckCinEvent, CheckCinState> {
  final CheckDataRepo _checkDataRepo;

  CheckCinBloc(
    this._checkDataRepo,
  ) : super(CheckCinInitial()) {
    on<CheckCinEvent>((event, emit) async {
      if (event is CheckCin) {
        emit(CheckCinLoading());
        _checkDataRepo.checkCin(event.base64);
        await Future.delayed(const Duration(seconds: 3), () {});
        emit(CheckCinSuccess());
      }
    });
  }
}
