import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    Key? key,
    required this.width,
    required this.text,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final double width;
  final String text;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          RoundCheckBox(
            onTap: onTap,
            isChecked: value,
            size: 16.5,
            border: Border.all(width: 1),
            checkedColor: Theme.of(context).colorScheme.primary,
            checkedWidget: const SizedBox(),
            animationDuration: const Duration(
              milliseconds: 100,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: Styles.normal12.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}