import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurance_info_item_title_and_value.dart';

class UserInsuranceInfoBody extends StatelessWidget {
  const UserInsuranceInfoBody({super.key, required this.devisInfo});

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - 80;
    String garanties = '';
    for (var element in devisInfo.garanties!) {
      garanties += "$element, ";
    }
    DateFormat dateFormat = DateFormat("yyyy/MM/dd");
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomListItem(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assurance auto',
                        style: Styles.normal14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        devisInfo.statu,
                        style: Styles.normal14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Id',
                    value: devisInfo.id!,
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Puissance fiscale',
                    value: '${devisInfo.puissanceFiscale} CV',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Type de carburant',
                    value: devisInfo.carburantType,
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Catégorie',
                    value: devisInfo.categorie,
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Garanties',
                    value: garanties,
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Montant',
                    value: '${devisInfo.montant} DH',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Date d’accordation',
                    value: dateFormat.format(devisInfo.dateDebut!.toDate()),
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Date d’annulation',
                    value:
                        dateFormat.format(devisInfo.dateAnnulation!.toDate()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
