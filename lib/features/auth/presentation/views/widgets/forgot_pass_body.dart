import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/forget_pass_blur_container.dart';

class ForgotPassBody extends StatelessWidget {
  const ForgotPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: size.height * .07,
            ),
            const LogoAndText(),
            const SizedBox(
              height: 112,
            ),
            const ForgotPassBlurContainer()
          ],
        ),
      ),
    );
  }
}
