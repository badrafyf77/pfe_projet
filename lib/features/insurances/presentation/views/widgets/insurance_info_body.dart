import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_border_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/fetch_insurance_info.dart';

class InsuranceInfoBody extends StatelessWidget {
  const InsuranceInfoBody({
    Key? key,
    required this.insuranceType,
  }) : super(key: key);

  final String insuranceType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fetchInsuranceInfo(insuranceType),
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






class InsuranceInfoTextHeader extends StatelessWidget {
  const InsuranceInfoTextHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      child: Text(
        text,
        style: Styles.normal16.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}