import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

part 'check_data_event.dart';
part 'check_data_state.dart';

class CheckDataBloc extends Bloc<CheckDataEvent, CheckDataState> {
  final CheckDataRepo _checkDataRepo;
  CheckDataBloc(this._checkDataRepo) : super(GetImageInitial()) {
    on<CheckDataEvent>((event, emit) async {
      if (event is GetImageEvent) {
        var result = await _checkDataRepo.getImage(event.source);
        result.fold((failure) {
          emit(GetImageInitial());
        }, (image) {
          emit(GetImageSucces(file: image));
        });
      }
    });
  }
}
