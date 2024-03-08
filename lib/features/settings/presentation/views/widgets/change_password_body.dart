import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/change_field_and_text.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangeEmailBodyState();
}

class _ChangeEmailBodyState extends State<ChangePasswordBody> {
  TextEditingController ancienPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

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
                text: "Ancien mot de passe :",
                passController: ancienPassController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre ancien mot de passe';
                  }
                  return null;
                },
                obscureText: true,
                hintText: "ancien mot de passe :",
              ),
              const SizedBox(
                height: 30,
              ),
              SecurityFieldAndTextItem(
                text: "Nouveau mot de passe :",
                passController: newPassController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre mot de passe';
                  } else if (value == ancienPassController.text) {
                    return "mot de pass ne peut pas être le même que l'ancien pass";
                  } else if (value.length < 8) {
                    return 'Mot de passe doit être d\'au moins 8 caractères';
                  }
                  return null;
                },
                obscureText: false,
                hintText: "votre nouveau mot de passe",
              ),
              const SizedBox(
                height: 30,
              ),
              SecurityFieldAndTextItem(
                text: "Confirmer mot de passe :",
                passController: confirmPassController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre confirmation mot de passe';
                  } else if (value != newPassController.text) {
                    return 'Mot de passe de confirmation doit être égale le mot de pass';
                  }
                  return null;
                },
                obscureText: true,
                hintText: "confirmation mot de passe",
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
