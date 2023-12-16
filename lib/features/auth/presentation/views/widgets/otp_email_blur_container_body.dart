import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/otp_custom_textfield.dart';

class OTPNumBlurContainerBody extends StatelessWidget {
  const OTPNumBlurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          const Text(
            'Code de vérification',
            style: Styles.normal27,
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'veuillez entrer le code de vérification envoyer à ',
              style: Styles.normal16,
              children: <TextSpan>[
                TextSpan(
                  text: '+212707314877',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                onpressed: () {},
                text: 'Renvoyer le code',
              )),
        ],
      ),
    );
  }
}
