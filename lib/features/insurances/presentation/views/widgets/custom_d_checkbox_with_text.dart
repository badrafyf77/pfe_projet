import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';

class DevisDCheckBox extends StatelessWidget {
  const DevisDCheckBox({
    Key? key,
    required this.devisDuration,
    required this.price,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final String devisDuration;
  final String price;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 75,
      width: 65,
      decoration: BoxDecoration(
        color: value
            ? Theme.of(context).colorScheme.primary
            : themeChange.darkTheme
                ? AppColors.kThirdColor
                : Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 12,
            width: 12,
            child: Checkbox(
              value: value,
              onChanged: onTap,
              shape: const CircleBorder(),
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              splashRadius: 4,
              activeColor: AppColors.kThirdColor,
              checkColor: AppColors.kThirdColor,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            devisDuration,
            style: Styles.normal8.copyWith(
              color: value
                  ? AppColors.kThirdColor
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            price,
            style: Styles.normal8.copyWith(
              color: value
                  ? AppColors.kThirdColor
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}