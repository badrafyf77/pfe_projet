import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 70,
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotate,
          colors: AppColors.gradientColors,
          strokeWidth: 3,
        ),
      ),
    );
  }
}