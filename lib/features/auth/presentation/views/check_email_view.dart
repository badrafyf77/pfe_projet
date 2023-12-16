import 'package:flutter/material.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/check_email_body.dart';


class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckEmailBody(),
    );
  }
}