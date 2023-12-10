import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/connect_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/google_button.dart';

class SignInBlurContainer extends StatelessWidget {
  const SignInBlurContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        BlurContainer(
          height: size.height * .55,
          width: size.width * .8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              TextAndTextField(
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
                text: 'Mot de passe',
                hintText: '++++++++',
                controller: passController,
                isPassField: true,
                prefixIcon: Icons.lock,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 30,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mot de passe oublie?',
                      style: Styles.normal12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              GoogleButton(
                size: size,
              ),
              const SizedBox(
                height: 60,
              ),
              const ConnectButton(),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRouters.signUpView);
                },
                child: const Text(
                  'S\'inscrire?',
                  style: Styles.normal12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
