
import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/custom_d_checkbox_with_text.dart';

class DevisDurationChoices extends StatelessWidget {
  const DevisDurationChoices({
    Key? key,
    required this.offer1,
    this.onTapOffer1,
    required this.offer2,
    this.onTapOffer2,
    required this.offer3,
    this.onTapOffer3,
  }) : super(key: key);

  final bool offer1;
  final Function(bool?)? onTapOffer1;
  final bool offer2;
  final Function(bool?)? onTapOffer2;
  final bool offer3;
  final Function(bool?)? onTapOffer3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DevisDCheckBox(
          devisDuration: '12 MOIS',
          price: '3011.60 DH',
          value: offer1,
          onTap: onTapOffer1,
        ),
        const SizedBox(
          width: 15,
        ),
        DevisDCheckBox(
          devisDuration: '06 MOIS',
          price: '1505.80 DH',
          value: offer2,
          onTap: onTapOffer2,
        ),
        const SizedBox(
          width: 15,
        ),
        DevisDCheckBox(
          devisDuration: '03 MOIS',
          price: '760.30 DH',
          value: offer3,
          onTap: onTapOffer3,
        ),
      ],
    );
  }
}