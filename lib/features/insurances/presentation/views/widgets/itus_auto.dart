import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/insurance_info_body.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/justify_text.dart';

class ItusAuto extends StatelessWidget {
  const ItusAuto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgReader(assetImage: AppImages.itusAuto, defaultSize: true),
            InsuranceInfoTextHeader(
              text: 'Itus Auto, c’est Quoi ?',
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42),
          child: Column(
            children: [
              JustifyText(
                text:
                    "Pour vous rendre à votre travail, pour déposer vos enfants à l’école, ou pour vous conduire à votre destination pendant vos voyages, votre auto vous accompagne dans vos différents déplacements. Il est essentiel de souscrire à une assurance de voiture pour vous couvrir en cas d'accident automobile.",
              ),
              SizedBox(
                height: 8,
              ),
              JustifyText(
                  text:
                      "Transporter vos proches en toute sécurité est votre responsabilité. Avec l'assurance auto Itus Auto, Itus Assurance protège vos déplacements et ceux de vos passagers.")
            ],
          ),
        ),
      ],
    );
  }
}