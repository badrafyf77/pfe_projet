import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animaton;
  late Animation<Offset> animatonLogo;
  double opacity = 0;

  @override
  initState() {
    super.initState();

    initAnimation();

    startAnimationAndNavigatToSignInView();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: animaton,
          builder: (context, _) {
            return Transform.scale(
              scale: animaton.value,
              child: const Center(
                child: SvgReader(assetImage: AppImages.vector,defaultSize: true,),
              ),
            );
          },
        ),
        Positioned(
          left: 165,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linear,
            opacity: opacity,
            child: Text(
              Constants.appTitle,
              style: Styles.titleStyle24,
            ),
          ),
        ),
        AnimatedBuilder(
            animation: animatonLogo,
            builder: (context, _) {
              return SlideTransition(
                position: animatonLogo,
                child: const SvgReader(assetImage: AppImages.appLogo,defaultSize: true,),
              );
            }),
      ],
    );
  }

  void startAnimationAndNavigatToSignInView() {
    Future.delayed(const Duration(seconds: 1, milliseconds: 400), () {
      if (mounted) {
        controller.forward();
        setState(() {
          opacity = 1;
        });
      }

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          AppRouter.navigateOff(context,AppRouter.signInView);
        }
      });
    });
  }

  void initAnimation() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animaton = Tween<double>(begin: 1, end: 7.7)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    animatonLogo =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1.2, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }
}
