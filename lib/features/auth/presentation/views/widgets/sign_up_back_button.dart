import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';

class SignUpBackButton extends StatelessWidget {
  const SignUpBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            context.go(AppRouters.signInView);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
        ),
      ),
    );
  }
}
