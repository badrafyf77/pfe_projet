// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/data/model/garantie_model.dart';

class GarantiesView extends StatelessWidget {
  const GarantiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Garanties',
      ),
      body: GarantiesBody(),
    );
  }
}

class GarantiesBody extends StatelessWidget {
  const GarantiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: BlurContainer(
        height: size.height * .65,
        width: size.width * .85,
        blurContainerBody: const GarantiesListAndButton(),
      ),
    );
  }
}

class GarantiesListAndButton extends StatefulWidget {
  const GarantiesListAndButton({
    super.key,
  });

  @override
  State<GarantiesListAndButton> createState() => _GarantiesListAndButtonState();
}

class _GarantiesListAndButtonState extends State<GarantiesListAndButton> {
  Garantie g1 = Garantie(
    title: 'Responsabilité civile',
    description:
        'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
    prix: 3011,
    checked: false,
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
  double total = 0;

  @override
  Widget build(BuildContext context) {
    garantiesList = [g1, g2, g3, g4, g5, g6, g7, g8, g9];
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
                  GarantieItem(
                    garantie: garantiesList[index],
                    onChanged: (p) {
                      setState(() {
                        garantiesList[index].checked =
                            !garantiesList[index].checked;
                        if (garantiesList[index].checked) {
                          total += garantiesList[index].prix;
                        } else {
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
                onPressed: () {},
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

class GarantiesPrixTotale extends StatelessWidget {
  const GarantiesPrixTotale({
    Key? key,
    required this.totale,
  }) : super(key: key);

  final double totale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: Text(
          'Totale : ${totale}DH',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GarantieItem extends StatefulWidget {
  const GarantieItem({
    Key? key,
    required this.garantie,
    required this.onChanged,
  }) : super(key: key);

  final Garantie garantie;
  final void Function(bool?) onChanged;

  @override
  State<GarantieItem> createState() => _GarantieItemState();
}

class _GarantieItemState extends State<GarantieItem> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        icon: Icon(
                            (expanded) ? Icons.expand_less : Icons.expand_more),
                      ),
                      Expanded(
                        child: Text(
                          widget.garantie.title,
                          style: Styles.normal14.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Row(
                  children: [
                    Text(
                      '${widget.garantie.prix.toString()} DH',
                      style: Styles.normal12.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Checkbox(
                      value: widget.garantie.checked,
                      onChanged: widget.onChanged,
                      shape: const CircleBorder(),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      checkColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Text(
                widget.garantie.description,
                style: Styles.normal12.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: (expanded) ? 10 : 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
