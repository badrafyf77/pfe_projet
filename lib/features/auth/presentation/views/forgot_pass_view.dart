import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPassBody(),
    );
  }
}

class ForgotPassBody extends StatelessWidget {
  const ForgotPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundContainer(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .15,
            ),
            const LogoAndText(),
            const SizedBox(
              height: 112,
            ),
            BlurContainer(
              height: size.height * .55,
              width: size.width * .8,
              blurContainerBody: const ForgotPassblurContainerBody(),
            )
          ],
        ),
      ),
    );
  }
}

class ForgotPassblurContainerBody extends StatelessWidget {
  const ForgotPassblurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Mot de passe oublier ?',
          style: Styles.normal27,
        ),
      ],
    );
  }
}
