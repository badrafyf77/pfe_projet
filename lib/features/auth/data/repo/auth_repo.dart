import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class AuthRepo
{
  Future<Either<Failure,UserCredential>> signUp(String email,String password);
  Future<Either<Failure,UserCredential>> signIn(String email,String password);
}