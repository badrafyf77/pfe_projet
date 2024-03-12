import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp(String email, String password, String nom, String prenom, String cin, String phone);
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<bool> checkEmail();
  Future<Either<Failure, bool>> forgotPass(String email);
}
