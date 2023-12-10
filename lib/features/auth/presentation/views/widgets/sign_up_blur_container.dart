import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/inscrire_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_up_back_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_up_container_body.dart';

class SignUpBlurContainer extends StatelessWidget {
  const SignUpBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: size.height * .75,
        ),
        BlurContainer(
          height: size.height * .7,
          width: size.width * .8,
          blurContainerBody: const SignUpContainerBody(),
        ),
        const SignUpBackButton(),
        const SinscrireButton()
      ],
    );
  }
}
