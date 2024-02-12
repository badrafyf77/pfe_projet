import 'package:flutter/material.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/app_header_title_and_back.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/settings_inner_body.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppHeader(
          text: "Paramètres",
        ),
        SettingsInnerBody(),
      ],
    );
  }
}
