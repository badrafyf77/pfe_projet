import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';

class SinscrireButton extends StatelessWidget {
  const SinscrireButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.5,
      right: 30,
      child: CustomButton(
        text: 'S\'inscrire',
        width: 134,
        onPressed: () {
          Get.toNamed(
            AppRouters.otpNumView,
          );
        },
      ),
    );
  }
}
