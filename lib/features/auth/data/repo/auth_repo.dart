import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp(String email, String password);
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<bool> checkEmail();
}
