import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/auth/data/auth_service.dart';
import 'package:pfe_projet/features/auth/data/models/sign_up_info.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  @override
  Future<Either<Failure, UserCredential>> signUp(
      UserInformation userInfo) async {
    try {
      var user = await Authservice.signUp(userInfo.email, userInfo.password);
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
  Future<Either<Failure, UserInfo>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
