// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    required this.withHeaderAndBackBar,
    this.title = "",
  }) : super(key: key);

  final bool withHeaderAndBackBar;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(withHeaderAndBackBar ? 197 : 150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: withHeaderAndBackBar ? 197 : 150,
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
      bottom: HorizontalLine(
        withHeaderAndBackBar: withHeaderAndBackBar,
        title: title,
      ),
    );
  }
}
