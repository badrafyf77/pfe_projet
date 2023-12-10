import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/otp/presentation/views/widgets/otp_email_blur_container_body.dart';

class OTPEmailBlurContainer extends StatelessWidget {
  const OTPEmailBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * .8,
      blurContainerBody: const OTPEmailBlurContainerBody(),
    );
  }
}
