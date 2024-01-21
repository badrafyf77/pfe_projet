import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_item_and_icon.dart';
import 'package:provider/provider.dart';

class SliderFooter extends StatelessWidget {
  const SliderFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderItem(
          onPressed: () {
            themeChange.darkTheme = !themeChange.darkTheme;
          },
          icon: themeChange.darkTheme
              ? CupertinoIcons.sun_max_fill
              : CupertinoIcons.moon_fill,
          text: 'Mode Claire',
        ),
        SliderItem(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (context.mounted) {
              AppRouter.navigateOff(context, AppRouter.splashView);
            }
          },
          icon: CupertinoIcons.power,
          text: 'Déconnexion',
        ),
      ],
    );
  }
}
