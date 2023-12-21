import 'package:flutter/material.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/forgot_pass_body.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPassBody(),
    );
  }
}