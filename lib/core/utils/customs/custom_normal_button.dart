// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/styles.dart';

class CustomNormalButton extends StatelessWidget {
  final Function()? onPressed;
  final String textButton;
  final Color backgroundColor;
  final double radius;
  final double height;
  final double width;
  const CustomNormalButton({
    Key? key,
    required this.onPressed,
    required this.textButton,
    required this.backgroundColor,
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
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              style: Styles.normal16,
            ),
          ),
        ),
      ),
    );
  }
}
