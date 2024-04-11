import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_body.dart';

class DevisBlurContainer extends StatelessWidget {
  const DevisBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          BlurContainer(
            height: size.height * .5,
            width: size.width * .7,
            opacity: 0.6,
            blurContainerBody: const DevisBody(),
          ),
        ],
      ),
    );
  }
}