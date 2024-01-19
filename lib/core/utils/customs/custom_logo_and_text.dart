// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/app_images.dart';

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
        Image.asset(
          AppImages.appLogo,
          scale: scale,
        ),
        if (alignment == MainAxisAlignment.center)
          const SizedBox(
            width: 18,
          ),
        Text(
          'ITUS INSURANCE',
          style: Styles.titleStyle24,
        ),
      ],
    );
  }
}
