import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_up_blur_container.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundContainer(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            const LogoAndText(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  SizedBox(
                    height: 112,
                  ),
                  SignUpBlurContainer(),
                  SizedBox(
                    height: 33,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
