import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/icon_button.dart';

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
      child: MyIconButton(
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
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.normal14,
          ),
        ),
      ],
    );
  }
}
