import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class DescriptionsText extends StatelessWidget {
  const DescriptionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsabilité civile',
          style: Styles.normal24.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '3011.60 DH',
              style: Styles.normal14.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Tarif TTC/12 mois',
              style: Styles.normal8.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}