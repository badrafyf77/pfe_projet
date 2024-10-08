import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class DevisICheckBox extends StatelessWidget {
  const DevisICheckBox({
    Key? key,
    required this.width,
    required this.text,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final double width;
  final String text;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 16,
            width: 16,
            child: Checkbox(
              value: value,
              onChanged: onTap,
              shape: const CircleBorder(),
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              checkColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: Styles.normal12.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
