import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';

class EditButtonWithText extends StatelessWidget {
  const EditButtonWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Votre Devis Itus oTo :',
              style: Styles.normal12.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '6 CV - Diesel',
              style: Styles.normal20.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        CustomNormalButton(
          onPressed: () {},
          textButton: "MODIFIER",
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: AppColors.kThirdColor,
          height: 45,
          width: 82,
        ),
      ],
    );
  }
}
