import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/helpers/validators.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/change_field_and_text.dart';

class ChangeEmailBody extends StatefulWidget {
  const ChangeEmailBody({super.key});

  @override
  State<ChangeEmailBody> createState() => _ChangeEmailBodyState();
}

class _ChangeEmailBodyState extends State<ChangeEmailBody> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailConfirmController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .75,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              SecurityFieldAndTextItem(
                text: "Votre mot de passe :",
                passController: passController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre mot de passe';
                  }
                  return null;
                },
                obscureText: true,
                hintText: "mot de passe",
              ),
              const SizedBox(
                height: 30,
              ),
              SecurityFieldAndTextItem(
                text: "Nouvelle adresse :",
                passController: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer email';
                  } else if (!isEmailValid(value)) {
                    return 'Entrer un valide email';
                  }
                  return null;
                },
                obscureText: false,
                hintText: "votre adresse",
              ),
              const SizedBox(
                height: 30,
              ),
              SecurityFieldAndTextItem(
                text: "Confirmer l’adresse :",
                passController: emailConfirmController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer email';
                  } else if (value != emailController.text) {
                    return 'Email de confirmation doit être égale l\'email';
                  } else if (!isEmailValid(value)) {
                    return 'Entrer un valide email de confirmation';
                  }
                  return null;
                },
                obscureText: false,
                hintText: "adresse confirmation",
              ),
              const SizedBox(
                height: 60,
              ),
              UnconstrainedBox(
                child: CustomNormalButton(
                  textButton: "Valider",
                  height: 50,
                  width: 120,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}