import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class CustomBorderButton extends StatelessWidget {
  final Function()? onPressed;
  final String textButton;
  final Color borderColor;
  final double radius;
  final double height;
  final double width;
  const CustomBorderButton({
    Key? key,
    required this.onPressed,
    required this.textButton,
    required this.borderColor,
    this.radius = 10,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            height: height,
            width: width,
            child: Center(
              child: Text(
                textButton,
                style: Styles.normal15.copyWith(
                  color: borderColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
