import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurance_info_item_title_and_value.dart';

class UserInsuranceInfoBody extends StatelessWidget {
  const UserInsuranceInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - 80;
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
                        'en cours de traitement',
                        style: Styles.normal14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Nom',
                    value: 'CIN+DC+ID',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Puissance fiscale',
                    value: '7CV',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Type de carburant',
                    value: 'Essence',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Catégorie',
                    value: 'Particuliers',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Garanties',
                    value:
                        'Vol,Bris des glas,Vol,Vol,Vol,Vol,Volhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Montant',
                    value: '5000DH',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Conseiller',
                    value: 'Ahmed Abdu',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Agence',
                    value: 'Berrechid',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Date d’accordation',
                    value: '12/10/2024',
                  ),
                  UserInsuranceItemTitleAndValue(
                    maxWidth: maxWidth,
                    title: 'Date d’annulation',
                    value: '12/10/2025',
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