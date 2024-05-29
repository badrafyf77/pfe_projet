import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_content.dart';
import 'package:provider/provider.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: themeChange.darkTheme
              ? AppColors.kDarkPrimaryColor
              : Colors.white.withAlpha(150),
          borderRadius: BorderRadius.circular(16),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: AppColors.kLightGradientColors,
            ),
            width: 1,
          ),
        ),
        child: NotificationContent(themeChange: themeChange),
      ),
    );
  }
}