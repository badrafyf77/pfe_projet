import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class HorizontalLine extends StatelessWidget implements PreferredSizeWidget {
  const HorizontalLine({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0.0),
      child: Container(
        color: AppColors.kThirdColor,
        height: 1.5,
      ),
    );
  }
}
