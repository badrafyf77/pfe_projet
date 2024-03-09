import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';

class JustifyText extends StatelessWidget {
  const JustifyText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Text(
      textAlign: TextAlign.justify,
      text,
      style: Styles.normal16.copyWith(
        color: themeChange.darkTheme
            ? AppColors.kThirdColor
            : Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}
