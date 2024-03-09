import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

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
