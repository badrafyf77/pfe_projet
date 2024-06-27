import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/utils/customs/drop_down_field.dart';

class SelectAgenceBlurContainerBody extends StatelessWidget {
  const SelectAgenceBlurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ['hh', 'dd', 'jj'];
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          'Choisissez votre Agence',
          style: Styles.normal24.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Veuillez choisir une ville',
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                ),
              ),
              MyDropDownField(
                onChanged: (s) {},
                items: list,
                initialValue: list[0],
              ),
              const SizedBox(height: 40),
              Text(
                'Veuillez choisir une agence',
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                ),
              ),
              MyDropDownField(
                onChanged: (s) {},
                items: list,
                initialValue: list[0],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        CustomGradientButton(
          text: 'Terminer',
          width: 134,
          onPressed: () {},
        ),
      ],
    );
  }
}
