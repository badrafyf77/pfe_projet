import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';
import 'package:pfe_projet/core/utils/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';

class ForgotPassblurContainerBody extends StatelessWidget {
  const ForgotPassblurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
      child: Column(
        children: [
          Text(
            'Mot de passe oublier ?',
            style: Styles.normal24.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Text(
            'Veuillez saisir votre email de connexion afin de recevoir un lien de réinitialisation de votre mot de passe',
            style: Styles.normal14,
          ),
          const SizedBox(
            height: 30,
          ),
          TextAndTextField(
            text: 'Email de connexion',
            hintText: 'Saisir votre email',
            controller: controller,
            isPassField: false,
            prefixIcon: Icons.mail,
          ),
          const SizedBox(
            height: 80,
          ),
          CustomButton(
            text: 'Recevoir le lien',
            width: 150,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
