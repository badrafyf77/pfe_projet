import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pfe_projet/core/model/services/auth_service.dart';
import 'package:pfe_projet/core/model/services/firestore_services.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/settings/data/repo/settings_repo.dart';

class SettingsRepoImplement implements SettingsRepo {
  final FirestoreService _firestoreService;
  final AuthService _authService;

  SettingsRepoImplement(
    this._firestoreService,
    this._authService,
  );

  @override
  Future<Either<Failure, UserInformation>> getUser(String email) async {
    try {
      var data = await _firestoreService.getUser(email);
      UserInformation user = UserInformation.fromJson(data);
      return right(user);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> changeEmail(String newEmail) async {
    try {
      await _authService.updateEmail(newEmail);
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirebaseAuthFailure(
            errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }
}
