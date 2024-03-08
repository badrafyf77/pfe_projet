// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/core/utils/helpers/validators.dart';
import 'package:provider/provider.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Changer l’adresse e-mail",
      ),
      body: ChangeEmailBody(),
    );
  }
}

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
              Column(
                children: [
                  const ChangeEmailAndPasswordText(
                    text: "Votre mot de passe :",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SecurityTextField(
                    controller: passController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre mot de passe';
                      }
                      return null;
                    },
                    obscureText: true,
                    hintText: "mot de passe",
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const ChangeEmailAndPasswordText(
                    text: "Nouvelle adresse :",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SecurityTextField(
                    controller: emailController,
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
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const ChangeEmailAndPasswordText(
                    text: "Confirmer l’adresse :",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SecurityTextField(
                    controller: emailConfirmController,
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
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              UnconstrainedBox(
                child: CustomButton(
                  text: "Valider",
                  width: 120,
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

class SecurityTextField extends StatelessWidget {
  const SecurityTextField({
    Key? key,
    required this.obscureText,
    required this.hintText,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      style: Styles.normal18.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.normal16.copyWith(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.kThirdColor,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
          height: 0,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class ChangeEmailAndPasswordText extends StatelessWidget {
  const ChangeEmailAndPasswordText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Styles.normal16.copyWith(
          color: themeChange.darkTheme
              ? AppColors.kThirdColor
              : Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
