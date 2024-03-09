import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class JustifyText extends StatelessWidget {
  const JustifyText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.justify,
      text,
      style: Styles.normal16.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}