import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/otp_email_blu_container.dart';

class OTPNumBody extends StatefulWidget {
  const OTPNumBody({super.key});

  @override
  State<OTPNumBody> createState() => _OTPNumBodyState();
}

class _OTPNumBodyState extends State<OTPNumBody> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            const LogoAndText(),
            const SizedBox(
              height: 75,
            ),
            const OTPNumBlurContainer(),
          ],
        ),
      ),
    );
  }
}
