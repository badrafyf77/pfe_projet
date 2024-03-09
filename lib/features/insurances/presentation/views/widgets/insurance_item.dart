import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class InsuranceItem extends StatelessWidget {
  const InsuranceItem({
    Key? key,
    required this.text,
    required this.onPresssed,
  }) : super(key: key);

  final String text;
  final Function()? onPresssed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPresssed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Styles.normal18.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
