import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/styles.dart';
import 'package:pfe_projet/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animaton;
  Animation<Offset>? animatonLogo;
  double opacity = 0;
  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animaton = Tween<double>(begin: 1, end: 7.7)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
    animatonLogo = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(-1.2, 0))
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));

    Future.delayed(const Duration(seconds: 1, milliseconds: 400), () {
      controller!.forward();
      setState(() {
        opacity = 1;
      });
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed(AppRouters.signInView);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: animaton!,
          builder: (context, _) {
            return Transform.scale(
              scale: animaton!.value,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/vector.png')),
                ),
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
              'ITUS INSURANCE',
              style: Styles.titleStyle24,
            ),
          ),
        ),
        AnimatedBuilder(
            animation: animatonLogo!,
            builder: (context, _) {
              return SlideTransition(
                position: animatonLogo!,
                child: Image.asset('assets/images/logo.png'),
              );
            }),
      ],
    )));
  }
}
