import 'package:flutter/material.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/app_header_title_and_back.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/settings_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(),
      body: Settings(),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppHeader(
          text: "Paramètres",
        ),
        SettingsBody(),
      ],
    );
  }
}


