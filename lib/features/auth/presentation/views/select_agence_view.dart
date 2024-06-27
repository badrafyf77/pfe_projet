import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/background_container.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';

class SelectAgenceView extends StatelessWidget {
  const SelectAgenceView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.appPadding),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .15,
              ),
              const LogoAndText(),
              const SizedBox(
                height: 75,
              ),
              const SelectAgenceBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAgenceBody extends StatelessWidget {
  const SelectAgenceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      height:
          MediaQuery.of(context).size.height * Constants.blurConatinerHeight,
      width: MediaQuery.of(context).size.width * Constants.blurConatinerWidth,
      blurContainerBody: const SelectAgenceBlurContainerBody(),
    );
  }
}

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

class MyDropDownField extends StatelessWidget {
  const MyDropDownField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.initialValue,
  });

  final Function(String?)? onChanged;
  final List<String> items;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: initialValue,
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: Styles.normal18.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(.23),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
        ),
        focusedBorder: const GradientOutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          gradient: LinearGradient(
            colors: AppColors.kLightGradientColors,
          ),
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.28),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
