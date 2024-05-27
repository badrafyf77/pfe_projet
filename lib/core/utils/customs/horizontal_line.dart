// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/app_header_title_and_back.dart';

class HorizontalLine extends StatelessWidget implements PreferredSizeWidget {
  const HorizontalLine({
    Key? key,
    this.color = AppColors.kThirdColor,
    this.withHeaderAndBackBar = false,
    this.title = "",
  }) : super(key: key);

  final Color color;
  final bool withHeaderAndBackBar;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: color,
            height: 1.5,
          ),
        ),
        if (withHeaderAndBackBar)
          AppHeader(
            text: title,
          ),
      ],
    );
  }
}
