import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfe_projet/core/services/firestore_services.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/data/repo/insurances_repo.dart';

class InsurancesRepoImplementation implements InsurancesRepo {
  final FirestoreService _firestoreService;

  InsurancesRepoImplementation(this._firestoreService);
  @override
  Future<Either<Failure, Unit>> stockInsurance(DevisInfo devisInfo) async {
    try {
      await _firestoreService.addAssurance(devisInfo);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, DevisInfo>> getInsurance(String id) async {
    try {
      DevisInfo devisInfo = await _firestoreService.getInsurance(id);
      return right(devisInfo);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, List<DevisInfo>>> getUserInsurances() async {
    try {
      List<DevisInfo> devisList = _firestoreService.getUserInsurances();
      return right(devisList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }
}
