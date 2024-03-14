import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserInformation>> getUser(String email);
  // Unit means indicates a successful operation without a meaningful value
  Future<Either<Failure, Unit>> changeEmail(String password, String newEmail);
}
