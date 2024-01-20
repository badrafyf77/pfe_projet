import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class SliderIcon extends StatelessWidget {
  const SliderIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.kThirdColor,
          size: 28,
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SliderIcon(icon: icon, onPressed: onPressed),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: Styles.normal14.copyWith(color: AppColors.kThirdColor),
        ),
      ],
    );
  }
}
