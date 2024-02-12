import 'package:flutter/material.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/setting_item.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SettingItem(
              text: "Région",
              onTap: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            SettingItem(
              text: "Données personnelles",
              onTap: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            SettingItem(
              text: "Sécurité",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
