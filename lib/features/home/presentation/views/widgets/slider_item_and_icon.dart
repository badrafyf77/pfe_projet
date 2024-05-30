// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/icon_button.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.icon,
    this.onPressed,
    required this.text,
    this.isMessagesReaded = true,
  });

  final IconData icon;
  final void Function()? onPressed;
  final String text;
  final bool isMessagesReaded;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            isMessagesReaded
                ? SliderIcon(icon: icon, onPressed: onPressed)
                : SliderNotificationIcon(icon: icon, onPressed: onPressed),
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
        ),
      ),
    );
  }
}

class SliderNotificationIcon extends StatelessWidget {
  const SliderNotificationIcon({
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
      child: Stack(
        children: [
          MyIconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColors.kThirdColor,
              size: 28,
            ),
          ),
          Positioned(
            top: 4,
            right: 5,
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
