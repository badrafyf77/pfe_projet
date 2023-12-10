import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/features/otp/presentation/views/widgets/otp_email_blu_container.dart';

class OTPEmailBody extends StatefulWidget {
  const OTPEmailBody({super.key});

  @override
  State<OTPEmailBody> createState() => _OTPEmailBodyState();
}

class _OTPEmailBodyState extends State<OTPEmailBody> {
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
            const OTPEmailBlurContainer(),
          ],
        ),
      ),
    );
  }
}
