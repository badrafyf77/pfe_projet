import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/setting_item.dart';

class SettingsInnerBody extends StatelessWidget {
  const SettingsInnerBody({super.key});

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
              onPressed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            SettingItem(
              text: "Données personnelles",
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.userInfoView);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            SettingItem(
              text: "Sécurité",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
