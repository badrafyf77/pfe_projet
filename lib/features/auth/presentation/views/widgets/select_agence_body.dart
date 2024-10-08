import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/select_agence_blur_container_body.dart';

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