import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';

class HomeBodyItemCard extends StatelessWidget {
  const HomeBodyItemCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: themeChange.darkTheme
                  ? AppColors.kDarkGradientColors
                  : AppColors.kLightGradientColors,
            ),
            width: 1,
          ),
          color: HSLColor.fromColor(Theme.of(context).colorScheme.secondary)
              .withLightness(themeChange.darkTheme ? 0.27 : 0.97)
              .toColor(),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 7,
              offset: const Offset(7, 9),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: themeChange.darkTheme
                    ? AppColors.kThirdColor
                    : AppColors.kLightPrimaryColor,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: Styles.normal12.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : AppColors.kLightPrimaryColor,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
