import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/utils/customs/drop_down_field.dart';
import 'package:pfe_projet/features/auth/data/helpers/fetch_advisor.dart';

class SelectAgenceBlurContainerBody extends StatelessWidget {
  const SelectAgenceBlurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> villesList = ['Casablanca', 'Berrechid', 'Rabat'];
    List<List<String>> allAgencesList = [
      ['Barnossi', 'Anwal', 'Ain diab'],
      ['Bloc', 'Yasmina', 'Castoss'],
      ['Agdal', 'Ta9adom', 'Hay riyad'],
    ];
    final ValueNotifier<List<String>> agencesList =
        ValueNotifier<List<String>>(allAgencesList[0]);
    String villeSelected = villesList[0];
    String agenceSelected = agencesList.value[0];
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Choisissez votre Agence',
          style: Styles.normal24.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Veuillez choisir une ville',
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                ),
              ),
              MyDropDownField(
                onChanged: (value) {
                  agencesList.value =
                      allAgencesList[villesList.indexOf(value!)];
                  villeSelected = value;
                },
                items: villesList,
                initialValue: villesList[0],
              ),
              const SizedBox(height: 40),
              Text(
                'Veuillez choisir une agence',
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                ),
              ),
              ValueListenableBuilder<List<String>>(
                valueListenable: agencesList,
                builder: (context, value, child) {
                  return MyDropDownField(
                    onChanged: (value) {
                      agenceSelected = value!;
                    },
                    items: value,
                    initialValue: value[0],
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        CustomGradientButton(
          text: 'Terminer',
          width: 134,
          onPressed: () {
            AppRouter.navigateToWithExtra(
                context,
                AppRouter.authFeature.signUpView,
                fetchAdvisor(villeSelected, agenceSelected));
          },
        ),
      ],
    );
  }
}
