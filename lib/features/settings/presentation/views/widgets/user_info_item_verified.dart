// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/icon_button.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';

class ItemVerified extends StatelessWidget {
  const ItemVerified({
    super.key,
    required this.isVerified,
    this.title = '',
    required this.value,
    required this.onPressed,
    this.noTitle = false,
  });

  final bool isVerified;
  final bool noTitle;
  final String title;
  final String value;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        if (!noTitle)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Styles.normal16.copyWith(
                color: themeChange.darkTheme
                    ? AppColors.kThirdColor
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(
                color: AppColors.kThirdColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.normal16.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isVerified
                    ? const Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : MyIconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
