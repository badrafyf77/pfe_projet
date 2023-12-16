import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/utils/helpers.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/google_button.dart';

class SignInBlurContainerBody extends StatelessWidget {
  const SignInBlurContainerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
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
            hintText: 'example@gmail.com',
            controller: emailController,
            isPassField: false,
            prefixIcon: Icons.mail,
          ),
          const SizedBox(
            height: 28,
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
            height: 2,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 30,
              child: CustomTextButton(
                onpressed: () {
                  AppRouters.navigateTo(
                    AppRouters.forgotPassView,
                  );
                },
                text: 'Mot de passe oublie?',
              ),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          const GoogleButton(),
          const SizedBox(
            height: 55,
          ),
          CustomButton(
            text: 'Se connecter',
            width: 143,
            onPressed: () {},
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextButton(
            onpressed: () {
              AppRouters.navigateTo(
                AppRouters.signUpView,
              );
            },
            text: 'S\'inscrire?',
          )
        ],
      ),
    );
  }
}
