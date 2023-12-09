import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/features/splash/presentation/views/widgets/spash_view_animation.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: const AnimationLogoAndText(),
    );
  }
}
