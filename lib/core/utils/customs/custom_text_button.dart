import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.kLightPrimaryColor;
          }
          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.white;
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Text(
        text,
        style: Styles.normal12,
      ),
    );
  }
}
