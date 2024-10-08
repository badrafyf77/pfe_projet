// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/services/firestore_services.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/home/data/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirestoreService _firestoreService;
  HomeRepoImplementation(
    this._firestoreService,
  );

  @override
  Future<Either<Failure, List<Message>>> getMessages() async {
    try {
      var result = _firestoreService.getMessages();
      await _firestoreService.updateMessagesStatu(true);
      return right(result);
    } catch (e) {
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<bool> getMessagesStatu() async {
    try {
      return await _firestoreService.isMessagesReaded();
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<bool> getCinStatu() async {
    try {
      return await _firestoreService.isCinVerified();
    } catch (e) {
      return false;
    }
  }
}
