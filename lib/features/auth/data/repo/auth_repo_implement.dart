import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/auth/data/models/sign_up_info.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo
{
  @override
  Future<Either<Failure, UserInfo>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserInfo>> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}