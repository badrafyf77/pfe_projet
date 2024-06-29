import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';

class DevisBlurContainer extends StatelessWidget {
  const DevisBlurContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          BlurContainer(
            height: size.height * .58,
            width: size.width * .75,
            opacity: 0.6,
            blurContainerBody: child,
          ),
        ],
      ),
    );
  }
}
