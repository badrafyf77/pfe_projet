import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/utils/helpers.dart';

class CheckEmailBlurContainerBody extends StatefulWidget {
  const CheckEmailBlurContainerBody({super.key});

  @override
  State<CheckEmailBlurContainerBody> createState() =>
      _CheckEmailBlurContainerBodyState();
}

class _CheckEmailBlurContainerBodyState extends State<CheckEmailBlurContainerBody> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      if (context.mounted) {
        myShowToast(context, 'Email vérifié avec succès', Colors.green);
      }
      timer?.cancel();
      AppRouters.navigateTo(AppRouters.otpNumView);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Vérifier votre email',
            style: Styles.normal24,
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Un lien de vérification par e-mail envoyé à ',
              style: Styles.normal16,
              children: <TextSpan>[
                TextSpan(
                  text: 'example@example.com',
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
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              text: 'Renvoyer le lien',
              onpressed: () {
                FirebaseAuth.instance.currentUser?.sendEmailVerification();
              },
            ),
          ),
        ],
      ),
    );
  }
}
