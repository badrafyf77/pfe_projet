import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/helpers.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';

class SignUpContainerBody extends StatelessWidget {
  const SignUpContainerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController cinController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        children: [
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer nom';
              }
              return null;
            },
            text: 'Nom',
            hintText: 'Nom',
            controller: nomController,
            isPassField: false,
            prefixIcon: Icons.person,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer prenom';
              }
              return null;
            },
            text: 'Prenom',
            hintText: 'Prenom',
            controller: prenomController,
            isPassField: false,
            prefixIcon: Icons.person,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer CIN';
              }
              return null;
            },
            text: 'Cin',
            hintText: 'Cin',
            controller: cinController,
            isPassField: false,
            prefixIcon: Icons.contact_mail,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer numéro de téléphone';
              }
              return null;
            },
            text: 'Numéro de téléphone',
            hintText: '0612345678',
            controller: phoneController,
            isPassField: false,
            prefixIcon: Icons.phone,
            justNumbers: true,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer email';
              } else if (value.isValidEmail()) {
                return 'Entrer valide email';
              }
              return null;
            },
            text: 'Email',
            hintText: 'Email',
            controller: emailController,
            isPassField: false,
            prefixIcon: Icons.mail,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer votre mot de passe';
              } else if (value.length < 8) {
                return 'Mot de passe doit être d\'au moins 8 caractères';
              }
              return null;
            },
            text: 'Mot de passe',
            hintText: '++++++++',
            controller: passController,
            isPassField: true,
            prefixIcon: Icons.lock,
          ),
          const SizedBox(
            height: 5,
          ),
          TextAndTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrer votre confirmation mot de passe';
              } else if (value.length < 8) {
                return 'Mot de passe doit être d\'au moins 8 caractères';
              }
              return null;
            },
            text: 'Confirmer le mot de passe',
            hintText: '++++++++',
            controller: confirmPassController,
            isPassField: true,
            prefixIcon: Icons.lock,
          ),
        ],
      ),
    );
  }
}
