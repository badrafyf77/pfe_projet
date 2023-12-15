import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/auth/data/models/sign_up_info.dart';

abstract class AuthRepo
{
  Future<Either<Failure,UserCredential>> signUp(UserInformation userInfo);
  Future<Either<Failure,UserInfo>> signIn();
}