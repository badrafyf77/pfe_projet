import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';

class SelectAgenceView extends StatelessWidget {
  const SelectAgenceView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .15,
              ),
              const LogoAndText(),
              const SizedBox(
                height: 75,
              ),
              const SelectAgenceBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAgenceBody extends StatelessWidget {
  const SelectAgenceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height:
          MediaQuery.of(context).size.height * Constants.blurConatinerHeight,
      width: MediaQuery.of(context).size.width * Constants.blurConatinerWidth,
      blurContainerBody: const SelectAgenceBlurContainerBody(),
    );
  }
}

class SelectAgenceBlurContainerBody extends StatelessWidget {
  const SelectAgenceBlurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
