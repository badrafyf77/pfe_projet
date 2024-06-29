import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/garantie_item.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/garanties_total_price.dart';

class GarantiesListAndButton extends StatefulWidget {
  const GarantiesListAndButton({
    super.key,
    required this.devisInfo,
  });

  final DevisInfo devisInfo;

  @override
  State<GarantiesListAndButton> createState() => _GarantiesListAndButtonState();
}

class _GarantiesListAndButtonState extends State<GarantiesListAndButton> {
  Garantie g1 = Garantie(
    title: 'Responsabilité civile',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: true,
  );
  Garantie g2 = Garantie(
    title: 'Défense et recours',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g3 = Garantie(
    title: 'Dommages tous accidents',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g4 = Garantie(
    title: 'Incendie',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g5 = Garantie(
    title: 'Vol',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g6 = Garantie(
    title: 'Bris de glaces',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g7 = Garantie(
    title: 'Protection des passagers',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g8 = Garantie(
    title: 'Rachat de vétusité',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  Garantie g9 = Garantie(
    title: 'Dommage collision',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
  );
  List<Garantie> garantiesList = [];
  List<Garantie> selectedGaranties = [];
  late double total;

  @override
  void initState() {
    super.initState();
    total = g1.prix;
    selectedGaranties.add(g1);
  }

  @override
  Widget build(BuildContext context) {
    garantiesList = [g2, g3, g4, g5, g6, g7, g8, g9];
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: garantiesList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0) const SizedBox(height: 10),
                  (index == 0)
                      ? GarantieItem(
                          garantie: g1,
                          onChanged: (p) {},
                        )
                      : GarantieItem(
                          garantie: garantiesList[index],
                          onChanged: (p) {
                            setState(() {
                              garantiesList[index].checked =
                                  !garantiesList[index].checked;
                              if (garantiesList[index].checked) {
                                selectedGaranties.add(garantiesList[index]);
                                total += garantiesList[index].prix;
                              } else {
                                selectedGaranties.remove(garantiesList[index]);
                                total -= garantiesList[index].prix;
                              }
                            });
                          },
                        ),
                  if (index == (garantiesList.length - 1))
                    const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GarantiesPrixTotale(
                totale: total,
              ),
              CustomNormalButton(
                onPressed: () {
                  widget.devisInfo.garantiesList = selectedGaranties;
                  AppRouter.navigateToWithExtra(
                    context,
                    AppRouter.insurancesFeature.devisDurationView,
                    widget.devisInfo,
                  );
                },
                textButton: 'Continue',
                backgroundColor: Theme.of(context).colorScheme.primary,
                height: 40,
                width: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}
