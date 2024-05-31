import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    Key? key,
    required this.file,
    required this.name,
  }) : super(key: key);

  final File file;
  final String name;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Image.file(
          file,
          fit: BoxFit.fill,
          height: 180,
          width: 250,
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: Styles.normal12.copyWith(
              color: themeChange.darkTheme
                  ? AppColors.kThirdColor
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
