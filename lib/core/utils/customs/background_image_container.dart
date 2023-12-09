// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/app_images.dart';

class BackgroundImageContainer extends StatelessWidget {
  final Widget widget;
  const BackgroundImageContainer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: widget,
    );
  }
}
