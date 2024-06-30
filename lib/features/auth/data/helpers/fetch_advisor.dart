import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:pfe_projet/features/auth/data/helpers/all_advisor.dart';

Advisor fetchAdvisor(String ville, String agence) {
  List<Advisor> list = [];
  for (var advisor in AllAdvisor.allAdvisor) {
    if (advisor.ville == ville && advisor.agence == agence) {
      list.add(advisor);
    }
  }
  return list[0];
}
