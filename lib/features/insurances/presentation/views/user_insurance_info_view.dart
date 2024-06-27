// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_dialog.dart';

class UserInsuranceInfoView extends StatelessWidget {
  const UserInsuranceInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsuranceInfoBody(),
    );
  }
}

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

class UserInsuranceItemTitleAndValue extends StatelessWidget {
  const UserInsuranceItemTitleAndValue({
    Key? key,
    required this.maxWidth,
    required this.title,
    required this.value,
  }) : super(key: key);

  final double maxWidth;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: maxWidth * 0.48,
            child: Text(
              title,
              style: Styles.normal14.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            ':',
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: maxWidth * 0.48,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  customShowDialog(
                    context,
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          value,
                          style: Styles.normal14.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  value,
                  style: Styles.normal14.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
