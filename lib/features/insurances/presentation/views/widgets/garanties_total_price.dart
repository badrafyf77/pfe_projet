import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class GarantiesPrixTotale extends StatelessWidget {
  const GarantiesPrixTotale({
    Key? key,
    required this.totale,
  }) : super(key: key);

  final double totale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Center(
        child: Text(
          'Totale : ${totale}DH',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}