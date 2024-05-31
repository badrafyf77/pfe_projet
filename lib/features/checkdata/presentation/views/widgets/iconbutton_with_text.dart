import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class IconButtonWithText extends StatelessWidget {
  const IconButtonWithText({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Styles.normal15.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: .65,
              child: Container(
                height: 104,
                width: 170,
                decoration: BoxDecoration(
                  color: AppColors.kThirdColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 45,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        )
      ],
    );
  }
}