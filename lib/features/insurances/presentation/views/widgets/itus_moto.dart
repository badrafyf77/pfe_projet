import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/insurance_info_body.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/justify_text.dart';

class ItusMoto extends StatelessWidget {
  const ItusMoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: InsuranceInfoTextHeader(
                  text: 'Itus Moto, c’est Quoi ?',
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SvgReader(assetImage: AppImages.itusMoto, defaultSize: true),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 42, right: 42, top: 40, bottom: 20),
            child: Column(
              children: [
                JustifyText(
                  text:
                      "Vous êtes propriétaire d'un deux roues, scooter ou moto? Wafa Moto est un contrat complet proposé à des tarifs très compétitifs. Les garanties sont adaptées pour vous permettre de rouler en toute sécurité.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
