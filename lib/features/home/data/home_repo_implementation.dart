// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/services/firestore_services.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';
import 'package:pfe_projet/features/home/data/model/home_preferences.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirestoreService _firestoreService;
  final HomePreferences _homePreferences;
  HomeRepoImplementation(
    this._firestoreService,
    this._homePreferences,
  );

  @override
  Future<Either<Failure, List<Message>>> getMessages() async {
    try {
      var result = _firestoreService.getMessages();
      await _firestoreService.updateIsMessagesReadedStatu(true);
      return right(result);
    } catch (e) {
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setHomePreferences() async {
    try {
      await _homePreferences
          .setIsMessagesReaded(await _firestoreService.isMessagesReaded());
          await _homePreferences
          .setIsCinVerified(await _firestoreService.isCinVerified());
      return right(unit);
    } catch (e) {
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
