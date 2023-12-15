import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget widget;
  const BackgroundContainer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.kPrimaryColor,
      child: widget,
    );
  }
}
