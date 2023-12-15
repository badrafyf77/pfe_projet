// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/custom_text_field.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class TextAndTextField extends StatelessWidget {
  const TextAndTextField({
    Key? key,
    required this.validator,
    this.justNumbers = false,
    required this.text,
    required this.hintText,
    required this.controller,
    required this.isPassField,
    required this.prefixIcon,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final bool justNumbers;
  final String text;
  final String hintText;
  final TextEditingController controller;
  final bool isPassField;
  final IconData prefixIcon;

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
              justNumbers: justNumbers,
              validator: validator,
            )),
      ],
    );
  }
}
