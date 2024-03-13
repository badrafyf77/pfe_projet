import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

part 'check_email_state.dart';

class CheckEmailCubit extends Cubit<CheckEmailState> {
  CheckEmailCubit(this._authRepo) : super(CheckEmailInitial());
  final AuthRepo _authRepo;

  Future<void> checkEmailCubit() async {
    var isEmailVerified = await _authRepo.checkEmail();
    if (isEmailVerified) {
      emit(CheckEmailSuccess());
    }
  }
}
