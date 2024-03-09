import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_item_and_icon.dart';

class SliderBody extends StatelessWidget {
  const SliderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.home,
          text: 'Acceuil',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.person,
          text: 'Mon Conseiller',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.mail,
          text: 'Email',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.homeFeature.notificationView);
          },
          icon: Icons.notifications,
          text: 'Messagerie',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.settingsFeature.settingsView);
          },
          icon: Icons.settings,
          text: 'Paramètres',
        ),
        const HorizontalLine(),
      ],
    );
  }
}
