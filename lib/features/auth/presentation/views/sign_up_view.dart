// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
    required this.advisor,
  }) : super(key: key);

  final Advisor advisor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(
        advisor: advisor,
      ),
    );
  }
}
