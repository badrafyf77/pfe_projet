import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(
    this.authRepo,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignUpEvent) {
        emit(SignUpLoading());
        var user = await authRepo.signUp(event.email, event.password);
        user.fold((failure) {
          emit(SignUpFailure(errorMessage: failure.errMessage));
        }, (userCredential) {
          emit(SignUpSuccess());
        });
      }

      if (event is SignInEvent) {
        emit(SignInLoading());
        var user = await authRepo.signIn(event.email, event.password);
        user.fold((failure) {
          emit(SignInFailure(errorMessage: failure.errMessage));
        }, (userCredential) {
          emit(SignInSuccess());
        });
      }
    });
  }
}
