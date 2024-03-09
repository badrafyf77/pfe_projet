import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/insurance_info_body.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/justify_text.dart';

class Itus90to extends StatelessWidget {
  const Itus90to({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                SvgReader(assetImage: AppImages.itus90to, defaultSize: true),
              ],
            ),
            InsuranceInfoTextHeader(
              text: 'Itus Auto, c’est Quoi ?',
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 42, right: 42, top: 30, bottom: 15),
          child: Column(
            children: [
              JustifyText(
                text:
                    "Soucieux(se) de votre confort, Mesdames, Itus Assurance a mis en place la première assurance auto dédiée aux jeunes au Maroc. Cette solution d'assurance et d'assistance vous propose des garanties spécifiques et des services premium en cas de sinistre.",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
