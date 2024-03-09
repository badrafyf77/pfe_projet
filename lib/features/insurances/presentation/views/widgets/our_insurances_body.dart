import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/insurance_item.dart';

class OurInsurancesBody extends StatelessWidget {
  const OurInsurancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 45,
        horizontal: MediaQuery.of(context).size.width * 0.09,
      ),
      child: BlurContainer(
        height: 240,
        width: MediaQuery.of(context).size.width * 0.82,
        opacity: 0.6,
        blurContainerBody: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const OurInsurancesHeader(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 35),
              child: Column(
                children: [
                  InsuranceItem(
                    text: "Itus Auto",
                    onPresssed: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InsuranceItem(
                    text: "Itus Moto",
                    onPresssed: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InsuranceItem(
                    text: "Itus 90to",
                    onPresssed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OurInsurancesHeader extends StatelessWidget {
  const OurInsurancesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.car,
          size: 43,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 25,
        ),
        Text(
          'Assurance Auto',
          style: Styles.normal20.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
