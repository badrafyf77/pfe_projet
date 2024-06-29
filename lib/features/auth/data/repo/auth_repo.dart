import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp(UserInformation userInfo, Advisor advisor);
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<bool> checkEmail();
  Future<Either<Failure, bool>> forgotPass(String email);
}
