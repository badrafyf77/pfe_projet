import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Message>>> getMessages();
  Future<bool> getMessagesStatu();
  Future<bool> getCinStatu();
}