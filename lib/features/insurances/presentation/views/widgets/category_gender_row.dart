import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/custom_i_checkbox_with_text.dart';

class CategoryAndGenderRow extends StatelessWidget {
  const CategoryAndGenderRow({
    Key? key,
    required this.text,
    required this.firstText,
    required this.firstValue,
    required this.secondText,
    required this.secondValue,
    this.onTapFirst,
    this.onTapSecond,
  }) : super(key: key);

  final String text;
  final String firstText;
  final bool firstValue;
  final String secondText;
  final bool secondValue;
  final Function(bool?)? onTapFirst;
  final Function(bool?)? onTapSecond;

  @override
  Widget build(BuildContext context) {
    double width = 120;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            text,
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DevisICheckBox(
              width: width,
              text: firstText,
              value: firstValue,
              onTap: onTapFirst,
            ),
            const SizedBox(width: 2),
            DevisICheckBox(
              width: width,
              text: secondText,
              value: secondValue,
              onTap: onTapSecond,
            ),
          ],
        ),
      ],
    );
  }
}
