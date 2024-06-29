// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_duration_choices.dart';

class SelectOffersWithButton extends StatefulWidget {
  const SelectOffersWithButton({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  State<SelectOffersWithButton> createState() => _SelectOffersWithButtonState();
}

class _SelectOffersWithButtonState extends State<SelectOffersWithButton> {
  bool offer1 = true;
  bool offer2 = false;
  bool offer3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DevisDurationChoices(
          offer1: offer1,
          onTapOffer1: (selected) {
            setState(() {
              offer1 = true;
              offer2 = false;
              offer3 = false;
            });
          },
          offer2: offer2,
          onTapOffer2: (selected) {
            setState(() {
              offer1 = false;
              offer2 = true;
              offer3 = false;
            });
          },
          offer3: offer3,
          onTapOffer3: (selected) {
            setState(() {
              offer1 = false;
              offer2 = false;
              offer3 = true;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomNormalButton(
          onPressed: () {
            AppRouter.navigateTo(
                context, AppRouter.insurancesFeature.autoDocumentsView);
          },
          textButton: "SUIVANT",
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: AppColors.kThirdColor,
          height: 40,
          width: 100,
        ),
      ],
    );
  }
}
