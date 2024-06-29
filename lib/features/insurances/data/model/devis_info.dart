// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';

class DevisInfo {
  final int puissanceFiscale;
  final String carburantType;
  final String categorie;
  final String sexe;
  List<Garantie>? garantiesList = [];
  double? montant;
  DateTime? dateDebut;
  DateTime? dateAnnulation;

  DevisInfo({
    required this.puissanceFiscale,
    required this.carburantType,
    required this.categorie,
    required this.sexe,
    this.garantiesList,
    this.montant,
    this.dateDebut,
    this.dateAnnulation,
  });
}
