import 'package:pfe_projet/core/configures/values.dart';
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';

double calcul12MonthTarif(List<Garantie> garantiesList) {
  double tarif = k12Montant;
  for (var garantie in garantiesList) {
    tarif += garantie.prix;
  }
  return tarif;
}

double calcul6MonthTarif(List<Garantie> garantiesList) {
  double tarif = k6Montant;
  for (var garantie in garantiesList) {
    tarif += (garantie.prix / 2);
  }
  return tarif;
}

double calcul3MonthTarif(List<Garantie> garantiesList) {
  double tarif = k3Montant;
  for (var garantie in garantiesList) {
    tarif += (garantie.prix / 4);
  }
  return tarif;
}
