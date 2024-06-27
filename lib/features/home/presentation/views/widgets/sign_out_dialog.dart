import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_dialog.dart';

Future<dynamic> signOutDialog(BuildContext context, void Function()? annuler,
      void Function()? confirmer) {
    return customShowDialog(
      context,
      Column(
        children: [
          const Spacer(),
          Text(
            "Confirmation",
            style: Styles.normal18.copyWith(
              color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          HorizontalLine(
            color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
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
    );
  }

