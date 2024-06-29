// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_auth_text_field.dart';

class PuissanceFiscalTextAndField extends StatelessWidget {
  const PuissanceFiscalTextAndField({
    Key? key,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Puissance fiscale(Nb de chevaux)',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .55,
          child: MyTextField(
            isPassField: false,
            justNumbers: true,
            gradientBorder: false,
            controller: controller,
            hintText: "Puissance fiscale",
            validator: validator,
          ),
        ),
      ],
    );
  }
}
