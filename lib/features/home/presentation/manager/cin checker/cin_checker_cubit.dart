// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';

part 'cin_checker_state.dart';

class CinStatuCubit extends Cubit<CinStatuState> {
  CinStatuCubit(
    this._homeRepo,
  ) : super(CinStatuInitial());

  final HomeRepo _homeRepo;

  Future<void> getCinStatu() async {
    var result = await _homeRepo.getCinStatu();
    emit(CinStatuSuccess(isCinVerified: result));
  }
}
