import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class CustomNormalButton extends StatelessWidget {
  final Function()? onPressed;
  final String textButton;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double height;
  final double width;
  const CustomNormalButton({
    Key? key,
    required this.onPressed,
    required this.textButton,
    required this.backgroundColor,
    this.textColor = AppColors.kThirdColor,
    this.radius = 10,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: Text(
              textButton,
              style: Styles.normal16.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
