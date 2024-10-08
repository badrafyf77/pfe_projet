import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/check_email_blur_container_body.dart';

class CheckEmailBlurContainer extends StatelessWidget {
  const CheckEmailBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height:
          MediaQuery.of(context).size.height * Constants.blurConatinerHeight,
      width: MediaQuery.of(context).size.width * Constants.blurConatinerWidth,
      blurContainerBody: const CheckEmailBlurContainerBody(),
    );
  }
}

