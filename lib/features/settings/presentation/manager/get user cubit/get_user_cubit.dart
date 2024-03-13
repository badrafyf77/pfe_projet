import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';

import 'package:pfe_projet/features/settings/data/repo/securite_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(
    this._userInfoRepo,
    this._email,
  ) : super(GetUserInitial());
  final SecuriteRepo _userInfoRepo;
  final String _email;

  Future<void> getUserCubit() async {
    var user = await _userInfoRepo.getUser(_email);
    user.fold((failure) {
      emit(GetUserFailure(errorMessage: failure.errMessage));
    }, (userInformation) {
      emit(GetUserSuccess(
        userInformation: userInformation,
      ));
    });
  }
}
