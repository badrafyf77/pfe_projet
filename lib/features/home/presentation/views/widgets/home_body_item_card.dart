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
    return Container(
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
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: ItemCardBody(
            icon: icon,
            themeChange: themeChange,
            text: text,
          ),
        ),
      ),
    );
  }
}

class ItemCardBody extends StatelessWidget {
  const ItemCardBody({
    super.key,
    required this.icon,
    required this.themeChange,
    required this.text,
  });

  final IconData icon;
  final DarkThemeProvider themeChange;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemIcon(icon: icon, themeChange: themeChange),
          const SizedBox(
            height: 8,
          ),
          ItemText(text: text, themeChange: themeChange),
        ],
      ),
    );
  }
}

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    super.key,
    required this.icon,
    required this.themeChange,
  });

  final IconData icon;
  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 48,
      color: themeChange.darkTheme
          ? AppColors.kThirdColor
          : AppColors.kLightPrimaryColor,
    );
  }
}

class ItemText extends StatelessWidget {
  const ItemText({
    super.key,
    required this.text,
    required this.themeChange,
  });

  final String text;
  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: Styles.normal12.copyWith(
        color: themeChange.darkTheme
            ? AppColors.kThirdColor
            : AppColors.kLightPrimaryColor,
        fontSize: 11,
      ),
      textAlign: TextAlign.center,
    );
  }
}
