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
    this.height = 85,
    this.width = 60,
  }) : super(key: key);
  final MainAxisAlignment alignment;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        SvgReader(
          assetImage: AppImages.appLogo,
          defaultSize: false,
          height: height,
          width: width,
        ),
        if (alignment == MainAxisAlignment.center)
          const SizedBox(
            width: 18,
          ),
        SizedBox(
          width: 200,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              Constants.appTitle,
              style: Styles.titleStyle22,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
