import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/change_email_body.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Changer l’adresse e-mail",
      ),
      body: ChangeEmailBody(),
    );
  }
}
