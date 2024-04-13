import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/custom_i_checkbox_with_text.dart';

class CarburantRow extends StatelessWidget {
  const CarburantRow({
    Key? key,
    required this.dieselValue,
    required this.essenceValue,
    required this.hybrideValue,
    this.onTapDiesel,
    this.onTapEssence,
    this.onTapHybride,
  }) : super(key: key);

  final bool dieselValue;
  final bool essenceValue;
  final bool hybrideValue;
  final Function(bool?)? onTapDiesel;
  final Function(bool?)? onTapEssence;
  final Function(bool?)? onTapHybride;

  @override
  Widget build(BuildContext context) {
    double width = 86;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Type de carburant',
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DevisICheckBox(
              width: width,
              text: 'Diesel',
              value: dieselValue,
              onTap: onTapDiesel,
            ),
            const SizedBox(width: 2),
            DevisICheckBox(
              width: width,
              text: 'Essence',
              value: essenceValue,
              onTap: onTapEssence,
            ),
            const SizedBox(width: 2),
            DevisICheckBox(
              width: width,
              text: 'Hybride',
              value: hybrideValue,
              onTap: onTapHybride,
            ),
          ],
        ),
      ],
    );
  }
}
