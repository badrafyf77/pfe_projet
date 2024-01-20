import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';

class BlurContineraBackButton extends StatelessWidget {
  const BlurContineraBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            AppRouter.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
        ),
      ),
    );
  }
}
