// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/custom_text_field.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class TextAndTextField extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final bool isPassField;
  final IconData prefixIcon;
  const TextAndTextField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.controller,
    required this.isPassField,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: Styles.normal16,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
            height: 44,
            child: MyTextField(
              isPassField: isPassField,
              controller: controller,
              prefixIcon: prefixIcon,
              hintText: hintText,
            )),
      ],
    );
  }
}
