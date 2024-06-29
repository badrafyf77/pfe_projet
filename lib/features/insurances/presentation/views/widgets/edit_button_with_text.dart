// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';

class EditButtonWithText extends StatelessWidget {
  const EditButtonWithText({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              'Votre Devis Itus oTo :',
              style: Styles.normal14.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              '${devisInfo.puissanceFiscale} CV - ${devisInfo.carburantType}',
              style: Styles.normal18.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
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
