// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/auth/data/auth_service.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  final AuthService _authService;

  AuthRepoImplement(
    this._authService,
  );
  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      var user = await _authService.signUp(email, password);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure(errMessage: e.code));
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      var user = await _authService.signIn(email, password);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure(errMessage: e.code));
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<bool> checkEmail() async {
    bool isEmailVerified = false;
    _authService.sendEmailVerification();
    while (isEmailVerified == false) {
      await Future.delayed(const Duration(seconds: 3), () async {
        isEmailVerified = await _authService.checkIsEmailVerified();
      });
      if (isEmailVerified) {
        break;
      }
    }
    return isEmailVerified;
  }
}
