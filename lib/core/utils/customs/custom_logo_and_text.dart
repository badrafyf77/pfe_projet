// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/app_images.dart';
import 'package:pfe_projet/core/utils/helpers/svg_reader.dart';

class LogoAndText extends StatelessWidget {
  const LogoAndText({
    Key? key,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.scale = 1.1,
  }) : super(key: key);
  final MainAxisAlignment alignment;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        const SvgReader(assetImage: AppImages.appLogo),
        if (alignment == MainAxisAlignment.center)
          const SizedBox(
            width: 18,
          ),
        Text(
          Constants.appTitle,
          style: Styles.titleStyle24,
        ),
      ],
    );
  }
}
