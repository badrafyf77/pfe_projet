// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_auth_text_field.dart';

class DevisView extends StatelessWidget {
  const DevisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(),
    );
  }
}

class DevisBlurContainer extends StatelessWidget {
  const DevisBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          BlurContainer(
            height: size.height * .5,
            width: size.width * .7,
            opacity: 0.6,
            blurContainerBody: const DevisBody(),
          ),
        ],
      ),
    );
  }
}

class DevisBody extends StatefulWidget {
  const DevisBody({super.key});

  @override
  State<DevisBody> createState() => _DevisBodyState();
}

class _DevisBodyState extends State<DevisBody> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool dieselValue = false;
  bool essenceValue = false;
  bool hybrideValue = false;
  bool particuliersValue = false;
  bool proValue = false;
  bool maleValue = false;
  bool femaleValue = false;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          PuissanceFiscalTextAndField(
            controller: controller,
          ),
          const SizedBox(
            height: 24,
          ),
          CarburantRow(
            dieselValue: dieselValue,
            onTapDiesel: (selected) {
              setState(() {
                if (dieselValue == false) {
                  essenceValue = false;
                  hybrideValue = false;
                }
                dieselValue = true;
              });
            },
            essenceValue: essenceValue,
            onTapEssence: (selected) {
              setState(() {
                if (essenceValue == false) {
                  dieselValue = false;
                  hybrideValue = false;
                }
                essenceValue = true;
              });
            },
            hybrideValue: hybrideValue,
            onTapHybride: (selected) {
              setState(() {
                if (hybrideValue == false) {
                  essenceValue = false;
                  dieselValue = false;
                }
                hybrideValue = true;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CategoryAndGenderRow(
            text: 'Catégorie',
            firstText: 'Particuliers',
            firstValue: particuliersValue,
            onTapFirst: (selected) {
              setState(() {
                if (particuliersValue == false) {
                  proValue = false;
                }
                particuliersValue = true;
              });
            },
            secondText: 'Professionnel',
            secondValue: proValue,
            onTapSecond: (selected) {
              setState(() {
                if (proValue == false) {
                  particuliersValue = false;
                }
                proValue = true;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CategoryAndGenderRow(
            text: 'Sex',
            firstText: 'Homme',
            firstValue: maleValue,
            onTapFirst: (selected) {
              setState(() {
                if (maleValue == false) {
                  femaleValue = false;
                }
                maleValue = true;
              });
            },
            secondText: 'Femme',
            secondValue: femaleValue,
            onTapSecond: (selected) {
              setState(() {
                if (femaleValue == false) {
                  maleValue = false;
                }
                femaleValue = true;
              });
            },
          ),
          const Spacer(),
          CustomNormalButton(
            onPressed: () {},
            textButton: "Suivant",
            backgroundColor: themeChange.darkTheme
                ? AppColors.kThirdColor
                : Theme.of(context).colorScheme.primary,
            textColor: themeChange.darkTheme
                ? Theme.of(context).colorScheme.primary
                : AppColors.kThirdColor,
            height: 40,
            width: 100,
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class CategoryAndGenderRow extends StatelessWidget {
  const CategoryAndGenderRow({
    Key? key,
    required this.text,
    required this.firstText,
    required this.firstValue,
    required this.secondText,
    required this.secondValue,
    this.onTapFirst,
    this.onTapSecond,
  }) : super(key: key);

  final String text;
  final String firstText;
  final bool firstValue;
  final String secondText;
  final bool secondValue;
  final Function(bool?)? onTapFirst;
  final Function(bool?)? onTapSecond;

  @override
  Widget build(BuildContext context) {
    double width = 120;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            text,
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCheckBox(
              width: width,
              text: firstText,
              value: firstValue,
              onTap: onTapFirst,
            ),
            const SizedBox(width: 2),
            MyCheckBox(
              width: width,
              text: secondText,
              value: secondValue,
              onTap: onTapSecond,
            ),
          ],
        ),
      ],
    );
  }
}

class CarburantRow extends StatelessWidget {
  const CarburantRow({
    Key? key,
    required this.dieselValue,
    required this.essenceValue,
    required this.hybrideValue,
    this.onTapDiesel,
    this.onTapEssence,
    this.onTapHybride,
  }) : super(key: key);

  final bool dieselValue;
  final bool essenceValue;
  final bool hybrideValue;
  final Function(bool?)? onTapDiesel;
  final Function(bool?)? onTapEssence;
  final Function(bool?)? onTapHybride;

  @override
  Widget build(BuildContext context) {
    double width = 86;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Type de carburant',
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCheckBox(
              width: width,
              text: 'Diesel',
              value: dieselValue,
              onTap: onTapDiesel,
            ),
            const SizedBox(width: 2),
            MyCheckBox(
              width: width,
              text: 'Essence',
              value: essenceValue,
              onTap: onTapEssence,
            ),
            const SizedBox(width: 2),
            MyCheckBox(
              width: width,
              text: 'Hybride',
              value: hybrideValue,
              onTap: onTapHybride,
            ),
          ],
        ),
      ],
    );
  }
}

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    Key? key,
    required this.width,
    required this.text,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final double width;
  final String text;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          RoundCheckBox(
            onTap: onTap,
            isChecked: value,
            size: 16.5,
            border: Border.all(width: 1),
            checkedColor: Theme.of(context).colorScheme.primary,
            checkedWidget: const SizedBox(),
            animationDuration: const Duration(
              milliseconds: 100,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: Styles.normal12.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class PuissanceFiscalTextAndField extends StatelessWidget {
  const PuissanceFiscalTextAndField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Puissance fiscale(Nb de chevaux)',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .55,
          child: MyTextField(
            isPassField: false,
            controller: controller,
            hintText: "Puissance fiscale",
            validator: (validator) {
              return "s";
            },
          ),
        ),
      ],
    );
  }
}
