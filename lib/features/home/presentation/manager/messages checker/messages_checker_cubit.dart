// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';
part 'messages_checker_state.dart';

class MessagesCheckerCubit extends Cubit<MessagesCheckerState> {
  MessagesCheckerCubit(
    this._homeRepo,
  ) : super(MessagesCheckerInitial());

  final HomeRepo _homeRepo;

  Future<void> getMessagesStatu() async {
    var result = await _homeRepo.getMessagesStatu();
    result.fold((left) {
      emit(MessagesCheckerFailure(err: left.errMessage));
    }, (right) {
      emit(MessagesCheckerSuccess(isMessagesReaded: right));
    });
  }
}
