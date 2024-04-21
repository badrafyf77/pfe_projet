import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/iconbutton_with_text.dart';

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