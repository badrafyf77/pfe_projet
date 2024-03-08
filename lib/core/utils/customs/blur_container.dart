// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    required this.height,
    required this.width,
    this.opacity = 0.1,
    this.color = Colors.white,
    required this.blurContainerBody,
  }) : super(key: key);

  final double height;
  final double width;
  final double opacity;
  final Color color;
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
                colors: AppColors.kLightGradientColors,
              ),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 23.0, sigmaY: 25.0),
              child: Opacity(
                opacity: opacity,
                child: Container(
                  width: width,
                  height: height,
                  color: color,
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

class MyBlurContainer extends StatelessWidget {
  const MyBlurContainer({
    Key? key,
    required this.height,
    required this.width,
    this.opacity = 0.1,
    this.color = Colors.white,
    required this.blurContainerBody,
  }) : super(key: key);

  final double height;
  final double width;
  final double opacity;
  final Color color;
  final Widget blurContainerBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 23.0, sigmaY: 25.0),
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Opacity(
                  opacity: opacity,
                  child: Container(
                    color: color,
                  ),
                ),
                blurContainerBody,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
