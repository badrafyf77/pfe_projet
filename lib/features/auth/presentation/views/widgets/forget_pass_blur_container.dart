import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/blur_container_back_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/forgot_pass_blur_container_body.dart';

class ForgotPassBlurContainer extends StatelessWidget {
  const ForgotPassBlurContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: size.height * .60,
        ),
        BlurContainer(
          height: size.height * .55,
          width: size.width * .8,
          blurContainerBody: const ForgotPassblurContainerBody(),
        ),
        const BlurContineraBackButton(),
      ],
    );
  }
}
