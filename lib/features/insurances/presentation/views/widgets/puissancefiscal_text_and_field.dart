import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_auth_text_field.dart';

class PuissanceFiscalTextAndField extends StatelessWidget {
  const PuissanceFiscalTextAndField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
            controller: controller,
            hintText: "Puissance fiscale",
            validator: (validator) {
              return "s";
            },
          ),
        ),
      ],
    );
  }
}