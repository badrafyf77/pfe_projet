import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/services/firebase_services.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/settings/data/repo/user_info_repo.dart';

class UserInfoRepoImplement implements UserInfoRepo {
  final FirebaseService _firebaseService;

  UserInfoRepoImplement(
    this._firebaseService,
  );

  @override
  Future<Either<Failure, UserInformation>> getUser(String email) async {
    try {
      var data = await _firebaseService.getUser(email);
      UserInformation user = UserInformation.fromJson(data);
      return right(user);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(
        FirestoreFailure(
            errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }
}
