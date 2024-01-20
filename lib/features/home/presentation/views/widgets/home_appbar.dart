import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      toolbarHeight: 150,
      elevation: 0,
      title: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          LogoAndText(
            alignment: MainAxisAlignment.center,
            height: 49.62,
            width: 39.62,
          ),
        ],
      ),
      bottom: const HorizontalLine(),
    );
  }
}
