import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    super.key,
    required this.themeChange,
  });

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification',
                style: Styles.normal12.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                ),
              ),
              Text(
                '12/02/2024',
                style: Styles.normal12.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mail',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.justify,
                style: Styles.normal14.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
