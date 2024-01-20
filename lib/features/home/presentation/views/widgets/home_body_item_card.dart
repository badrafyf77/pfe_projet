import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
            ),
            width: 1,
          ),
          color: const Color(0xFFFBF6ED),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
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
                color: AppColors.kPrimaryColor,
              ),
              Text(
                text,
                style: Styles.normal12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
