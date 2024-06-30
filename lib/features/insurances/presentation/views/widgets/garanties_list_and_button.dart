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
        "Garantie d'assistance juridique, elle permet d'aider et accompagner l'automobiliste lorsqu'il a subi ou causé un accident de la circulation au sujet duquel son niveau de responsabilité est contesté.",
    prix: 1008,
    checked: false,
  );
  Garantie g3 = Garantie(
    title: 'Dommages tous accidents',
    description:
        "Cette garantie assure tous les dommages subis par votre véhicule assuré suite à une collision avec un autre véhicule, un choc avec un corps fixe ou mobile ou un renversement sans collision préalable.",
    prix: 505,
    checked: false,
  );
  Garantie g4 = Garantie(
    title: 'Incendie',
    description:
        "Garantie qui couvre les dommages causés au véhicule assuré en cas d’incendie, d’explosion, d’embrasement, de simple combustion ou de chute de la foudre.",
    prix: 700,
    checked: false,
  );
  Garantie g5 = Garantie(
    title: 'Vol',
    description:
        "Garantie qui couvre les dommages subis par le véhicule assuré en cas de disparition ou de détérioration de celui-ci suite à un vol ou tentative de vol.",
    prix: 1100,
    checked: false,
  );
  Garantie g6 = Garantie(
    title: 'Bris de glaces',
    description:
        "Cette garantie vous couvre contre les dommages subis par les parties vitrées de votre véhicule assuré à savoir les vitres latérales, pare-brise, lunette arrière et toit ouvrant.",
    prix: 200,
    checked: false,
  );
  Garantie g7 = Garantie(
    title: 'Protection des passagers',
    description:
        "Garantie qui couvre les dommages corporels causés au conducteur et aux personnes transportées à l’intérieur du véhicule assuré à la suite d’un accident automobile.",
    prix: 920,
    checked: false,
  );
  Garantie g8 = Garantie(
    title: 'Rachat de vétusité',
    description:
        "Garantie couvrant le montant de la vétusté restant à la charge de l’assuré en cas de sinistre partiel affectant les garanties Dommage tous accidents, Incendie, Vol et Inondation.",
    prix: 2099,
    checked: false,
  );
  Garantie g9 = Garantie(
    title: 'Dommage collision',
    description:
        "Cette garantie vous couvre contre les dégâts subis par votre véhicule assuré en cas de collision avec un autre véhicule identifié, que vous soyez responsable ou non.",
    prix: 1099,
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
