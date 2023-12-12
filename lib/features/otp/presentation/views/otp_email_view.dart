import 'package:flutter/material.dart';
import 'package:pfe_projet/features/otp/presentation/views/widgets/otp_email_body.dart';

class OTPEmailView extends StatelessWidget {
  const OTPEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OTPEmailBody(),
    );
  }
}
