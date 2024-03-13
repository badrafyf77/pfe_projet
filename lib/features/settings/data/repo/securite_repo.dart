import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/user_info_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class SecuriteRepo {
  Future<Either<Failure, UserInformation>> getUser(String email);
}
