import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/customs/custom_border_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';

class InsurancesInfoView extends StatelessWidget {
  final String insuranceType;
  const InsurancesInfoView({
    Key? key,
    required this.insuranceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: insuranceType,
      ),
      body: const InsuranceInfo(),
    );
  }
}

class InsuranceInfo extends StatelessWidget {
  const InsuranceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const SvgReader(assetImage: AppImages.itusAuto, defaultSize: true),
            Positioned(
              top: 32,
              child: Text(
                'Itus Auto, c’est Quoi ?',
                style: Styles.normal16.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        const Padding(
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
        const SizedBox(
          height: 20,
        ),
        CustomBorderButton(
          onPressed: () {},
          textButton: "Simuler rapidement mon devis",
          borderColor: Theme.of(context).colorScheme.primary,
          height: 50,
          width: 250,
        ),
        const SizedBox(
          height: 22,
        ),
        CustomNormalButton(
          onPressed: () {},
          textButton: "Je demande un devis",
          backgroundColor: Theme.of(context).colorScheme.primary,
          height: 50,
          width: 185,
        )
      ],
    );
  }
}

class JustifyText extends StatelessWidget {
  const JustifyText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      text,
      style: Styles.normal15.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
