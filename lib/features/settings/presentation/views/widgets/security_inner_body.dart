import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/setting_item.dart';

class SecurityInnerBody extends StatelessWidget {
  const SecurityInnerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          SettingItem(
            text: "Changer l’adresse e-mail",
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.settingsFeature.changeEmailView);
            },
          ),
          const SizedBox(
            height: 40,
          ),
          SettingItem(
            text: "Changer le mot de passe",
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.settingsFeature.changePasswordView);
            },
          ),
        ],
      ),
    );
  }
}
