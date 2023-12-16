import 'package:flutter/material.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/otp_email_body.dart';

class OTPNumView extends StatelessWidget {
  const OTPNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: OTPNumBody(),
    );
  }
}
