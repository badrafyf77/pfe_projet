import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';

class SinscrireButton extends StatelessWidget {
  const SinscrireButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.5,
      right: 30,
      child: CustomGradientButton(
        text: 'S\'inscrire',
        width: 134,
        onPressed: () {
          AppRouter.navigateOff(
            context,
            AppRouter.authFeature.otpNumView,
          );
        },
      ),
    );
  }
}
