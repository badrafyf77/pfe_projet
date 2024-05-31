// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';
part 'home_preferences_state.dart';

class HomePreferencesCubit extends Cubit<HomePreferencesState> {
  HomePreferencesCubit(
    this._homeRepo,
  ) : super(HomePreferencesInitial());

  final HomeRepo _homeRepo;

  Future<void> getHomePreferences() async {
    var result = await _homeRepo.setHomePreferences();
    result.fold((left) {
      emit(HomePreferencesFailure(err: left.errMessage));
    }, (right) {
      emit(HomePreferencesSuccess());
    });
  }
}
