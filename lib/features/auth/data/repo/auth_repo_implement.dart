import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/auth/data/auth_service.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  @override
  Future<Either<Failure, UserCredential>> signUp(String email,String password) async {
    try {
      var user = await Authservice.signUp(email, password);
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
  Future<Either<Failure, UserCredential>> signIn(String email,String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
