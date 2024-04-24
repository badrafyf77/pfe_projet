import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

part 'get_image_event.dart';
part 'get_image_state.dart';

class GetImageBloc extends Bloc<GetImageEvent, GetImageState> {
  final CheckDataRepo _checkDataRepo;
  GetImageBloc(this._checkDataRepo) : super(GetImageInitial()) {
    on<GetImageEvent>((event, emit) async{
      // ignore: unnecessary_type_check
      if (event is GetImageEvent) {
        var result = await _checkDataRepo.getImage(event.source);
        result.fold((failure) {
          emit(GetImageFailure(errorMessage: failure.errMessage));
        }, (image) {
          emit(GetImageSucces(file: image));
        });
      }
    });
  }
}
