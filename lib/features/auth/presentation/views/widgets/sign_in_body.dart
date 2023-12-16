import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_in_blur_container.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              const LogoAndText(),
              const SizedBox(
                height: 112,
              ),
              const SignInBlurContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
