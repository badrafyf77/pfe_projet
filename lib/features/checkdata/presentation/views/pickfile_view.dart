// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class PickFileView extends StatelessWidget {
  const PickFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Vérifier mes données",
      ),
      body: PickFileBody(),
    );
  }
}

class PickFileBody extends StatelessWidget {
  const PickFileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          IconButtonWithText(
            text: 'Prendre en photo la CIN :',
            icon: Icons.camera_alt,
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          IconButtonWithText(
            text: 'Choisir une photo  de la CIN :',
            icon: Icons.insert_photo,
            onPressed: () {},
          ),
          const SizedBox(
            height: 150,
          ),
          CustomNormalButton(
            onPressed: () {},
            textButton: "Valider",
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: AppColors.kThirdColor,
            height: 50,
            width: 130,
          ),
        ],
      ),
    );
  }
}

class IconButtonWithText extends StatelessWidget {
  const IconButtonWithText({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Styles.normal15.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: .65,
              child: Container(
                height: 104,
                width: 170,
                decoration: BoxDecoration(
                  color: AppColors.kThirdColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 45,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        )
      ],
    );
  }
}
