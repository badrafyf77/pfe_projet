// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  GetMessagesCubit(
    this._homeRepo,
  ) : super(GetMessagesInitial());

  final HomeRepo _homeRepo;

  Future<void> getMessagesCubit() async {
    var result = await _homeRepo.getMessages();
    
  }
}
