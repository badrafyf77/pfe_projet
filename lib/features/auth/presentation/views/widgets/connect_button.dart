import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_colors.dart';
import 'package:pfe_projet/core/utils/customs/custom_button_with_gradient_color.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
        strokeWidth: 1,
        radius: 12,
        gradient: const LinearGradient(
          colors: AppColors.gradientColors,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(12)),
          height: 38,
          width: 143,
          child: const Center(
              child: Text(
            'Se connecter',
            style: Styles.normal16,
          )),
        ),
        onPressed: () {});
  }
}
