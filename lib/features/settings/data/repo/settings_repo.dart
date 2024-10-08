import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserInformation>> getUser(String email);

  Future<Either<Failure, Unit>> changeEmail(String password, String newEmail);

  Future<Either<Failure, Unit>> changePassword(String oldPassword, String newPassword);
}
