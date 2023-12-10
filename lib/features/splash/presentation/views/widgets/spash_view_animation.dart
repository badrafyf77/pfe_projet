import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class AnimationLogoAndText extends StatefulWidget {
  const AnimationLogoAndText({super.key});

  @override
  State<AnimationLogoAndText> createState() => _AnimationLogoAndTextState();
}

class _AnimationLogoAndTextState extends State<AnimationLogoAndText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingLogoAnimation;
  late Animation<Offset> slidingTextAnimation;

  @override
  void initState() {
    super.initState();

    initAnimation();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                  animation: slidingLogoAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                      position: slidingLogoAnimation,
                      child: Image.asset(AppImages.appLogo),
                    );
                  }),
              AnimatedBuilder(
                  animation: slidingTextAnimation,
                  builder: (context, _) {
                    return SlideTransition(
                      position: slidingTextAnimation,
                      child: Text(
                        'ITUS INSURANCE',
                        style: Styles.normal24.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 350),
    );

    slidingLogoAnimation =
        Tween<Offset>(begin: const Offset(0, -3), end: Offset.zero)
            .animate(animationController);

    slidingTextAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }
}
