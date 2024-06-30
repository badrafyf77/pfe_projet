import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:uuid/uuid.dart';

class AllAdvisor {
  static List<Advisor> allAdvisor = [casa1, casa2, casa3];
}

Advisor casa1 = Advisor(
    id: const Uuid().v4(),
    nomComplet: 'oussama khalid',
    email: 'email@khalid.com',
    phone: '0827961133',
    agence: 'Anwal',
    ville: 'Casablanca');
Advisor casa2 = Advisor(
    id: const Uuid().v4(),
    nomComplet: 'smail omar',
    email: 'email@khalid.com',
    phone: '0827961133',
    agence: 'Barnossi',
    ville: 'Casablanca');
Advisor casa3 = Advisor(
    id: const Uuid().v4(),
    nomComplet: 'smail omar',
    email: 'email@khalid.com',
    phone: '0827961133',
    agence: 'Ain diab',
    ville: 'Casablanca');
