import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  const BackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: AppColors.kLightPrimaryColor,
      child: child,
    );
  }
}
