// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:pfe_projet/core/utils/app_colors.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.blurContainerBody,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget blurContainerBody;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                colors: AppColors.gradientColors,
              ),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 23.0, sigmaY: 25.0),
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        blurContainerBody,
      ],
    );
  }
}
