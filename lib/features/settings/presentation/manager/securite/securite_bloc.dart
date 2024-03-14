// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/model/services/auth_service.dart';

import 'package:pfe_projet/features/settings/data/repo/settings_repo.dart';

part 'securite_event.dart';
part 'securite_state.dart';

class SecuriteBloc extends Bloc<SecuriteEvent, SecuriteState> {
  final SettingsRepo _settingsRepo;
  SecuriteBloc(
    this._settingsRepo,
  ) : super(SecuriteInitial()) {
    on<SecuriteEvent>((event, emit) async {
      if (event is ChangeEmailEvent) {
        emit(ChangeEmailLoading());
        if (await AuthService().checkPassword(event.password) == false) {
          emit(ChangeEmailFailure(errorMessage: "Mot de passe incorrect."));
        } else {
          var data = await _settingsRepo.changeEmail(event.password, event.newEmail);
          data.fold((failure) {
            emit(ChangeEmailFailure(errorMessage: failure.errMessage));
          }, (userCredential) {
            emit(ChangeEmailSuccess());
          });
        }
      }
    });
  }
}
