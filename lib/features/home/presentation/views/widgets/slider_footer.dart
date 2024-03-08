import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';
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
            signOutDialog(
              context,
              () {
                Navigator.of(context).pop();
              },
              () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  AppRouter.navigateOff(context, AppRouter.splashView);
                }
              },
            );
          },
          icon: CupertinoIcons.power,
          text: 'Déconnexion',
        ),
      ],
    );
  }

  Future<T?> signOutDialog<T>(BuildContext context, void Function()? annuler,
      void Function()? confirmer) {
    return showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext build) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: MyBlurContainer(
              height: 180,
              width: 300,
              opacity: 0.6,
              color: Colors.white,
              blurContainerBody: Column(
                children: [
                  const Spacer(),
                  Text(
                    "Confirmation",
                    style: Styles.normal18.copyWith(
                      color: Theme.of(build).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Souhaitez-vous réellement vous déconnecter ?",
                    textAlign: TextAlign.center,
                    style: Styles.normal16.copyWith(
                      color: Theme.of(build).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  HorizontalLine(
                    color: Theme.of(build).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 50,
                    width: 295,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: annuler,
                          child: SizedBox(
                            width: 135,
                            child: Center(
                              child: Text(
                                "Annuler",
                                style: Styles.normal18.copyWith(
                                  color: Theme.of(build).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Theme.of(build).colorScheme.primary,
                          thickness: 1.5,
                        ),
                        GestureDetector(
                          onTap: confirmer,
                          child: SizedBox(
                            width: 135,
                            child: Center(
                              child: Text(
                                "Confirmer",
                                style: Styles.normal18.copyWith(
                                  color: Theme.of(build).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
