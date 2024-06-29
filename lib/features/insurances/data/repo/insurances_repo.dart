import 'package:dartz/dartz.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';

abstract class InsurancesRepo {
  Future<Either<Failure, Unit>> stockInsurance(DevisInfo devisInfo);

  Future<Either<Failure, DevisInfo>> getInsurance(String id);
}