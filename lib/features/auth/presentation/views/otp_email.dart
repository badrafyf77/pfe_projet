import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/core/utils/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/blur_container.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_OTP_textfield.dart';

class OTPEmailView extends StatelessWidget {
  const OTPEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: OTPEmailBody(),
    );
  }
}

class OTPEmailBody extends StatefulWidget {
  const OTPEmailBody({super.key});

  @override
  State<OTPEmailBody> createState() => _OTPEmailBodyState();
}

class _OTPEmailBodyState extends State<OTPEmailBody> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            const LogoAndText(),
            const SizedBox(
              height: 75,
            ),
            const OTPEmailBlurContainer(),
          ],
        ),
      ),
    );
  }
}

class OTPEmailBlurContainer extends StatelessWidget {
  const OTPEmailBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        BlurContainer(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * .8,
        ),
        const OTPEmailBlurContainerBody()
      ],
    );
  }
}

class OTPEmailBlurContainerBody extends StatelessWidget {
  const OTPEmailBlurContainerBody({super.key});

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
                  text: 'exemple@gmail.com',
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
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Renvoyer le code',
              style: Styles.normal14,
            ),
          ),
        ],
      ),
    );
  }
}
