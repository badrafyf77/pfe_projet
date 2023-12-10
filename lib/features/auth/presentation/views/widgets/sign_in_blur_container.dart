import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_in_blur_container_body.dart';

class SignInBlurContainer extends StatelessWidget {
  const SignInBlurContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlurContainer(
      height: size.height * Constants.blurConatinerHeight,
      width: size.width * Constants.blurConatinerWidth,
      blurContainerBody: const SignInBlurContainerBody(),
    );
  }
}
