// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';

class DevisInfo {
  String? id;
  final int puissanceFiscale;
  final String carburantType;
  final String categorie;
  final String sexe;
  List<Garantie>? garantiesList = [];
  List? garanties = [];
  double? montant;
  Timestamp? dateDebut;
  Timestamp? dateAnnulation;
  final String statu;
  final bool carteGrisVerifiede;
  final bool permisRectoVerified;
  final bool permisVersoVerified;

  DevisInfo({
    this.id,
    required this.puissanceFiscale,
    required this.carburantType,
    required this.categorie,
    required this.sexe,
    this.garantiesList,
    this.garanties,
    this.montant,
    this.dateDebut,
    this.dateAnnulation,
    this.statu = 'en cours de traitement',
    this.carteGrisVerifiede = false,
    this.permisRectoVerified = false,
    this.permisVersoVerified = false,
  });

  DevisInfo.fromJson(json)
      : this(
          id: json['id'] as String,
          puissanceFiscale: json['puissanceFiscale'] as int,
          carburantType: json['carburantType'] as String,
          categorie: json['categorie'] as String,
          sexe: json['sexe'] as String,
          garanties: json['garanties'] as List,
          montant: json['montant'] as double,
          dateDebut: json['dateDebut'] as Timestamp,
          dateAnnulation: json['dateAnnulation'] as Timestamp,
          statu: json['statu'] as String,
          carteGrisVerifiede: json['carteGrisVerifiede'] as bool,
          permisRectoVerified: json['permisRectoVerified'] as bool,
          permisVersoVerified: json['permisVersoVerified'] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'puissanceFiscale': puissanceFiscale,
      'carburantType': carburantType,
      'categorie': categorie,
      'sexe': sexe,
      'garanties': garanties,
      'montant': montant,
      'dateDebut': dateDebut,
      'dateAnnulation': dateAnnulation,
      'statu': statu,
      'carteGrisVerifiede': carteGrisVerifiede,
      'permisRectoVerified': permisRectoVerified,
      'permisVersoVerified': permisVersoVerified,
    };
  }
}
