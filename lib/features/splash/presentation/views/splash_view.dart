import 'dart:async';

import 'package:flutter/material.dart';
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
  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animaton = Tween<double>(begin: 1, end: 7.5)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
    animatonLogo = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(-1, 0))
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      controller!.forward();
                    },
                    child: const Text(
                      'forward',
                      style: TextStyle(color: Colors.amber),
                    )),
                TextButton(
                    onPressed: () {
                      controller!.reverse();
                    },
                    child: const Text(
                      'reverse',
                      style: TextStyle(color: Colors.amber),
                    ))
              ],
            ),
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
                const Text(
                  'ITUS INSURANCE',
                  style: Styles.normal27,
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
