import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_button_with_gradient_color.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class SinscrireButton extends StatelessWidget {
  const SinscrireButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.5,
      right: 30,
      child: UnicornOutlineButton(
          strokeWidth: 0.7,
          radius: 12,
          gradient: const LinearGradient(colors: [
            Color(0XFF827777),
            Color(0XFFEFC887),
          ]),
          child: Container(
            height: 42,
            width: 134,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(16)),
            child: const Center(
              child: Text(
                'S\'inscrire',
                style: Styles.normal16,
              ),
            ),
          ),
          onPressed: () {}),
    );
  }
}
