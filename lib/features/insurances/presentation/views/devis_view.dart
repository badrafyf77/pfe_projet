// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 35,
          ),
          PuissanceFiscalTextAndField(
            controller: controller,
          ),
          const SizedBox(
            height: 35,
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
        ],
      ),
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
    return Column(
      children: [
        Text(
          'Type de carburant',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCheckBox(
              text: 'Diesel',
              value: dieselValue,
              onTap: onTapDiesel,
            ),
            const SizedBox(width: 2),
            MyCheckBox(
              text: 'Essence',
              value: essenceValue,
              onTap: onTapEssence,
            ),
            const SizedBox(width: 2),
            MyCheckBox(
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
    required this.text,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final String text;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 86,
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
