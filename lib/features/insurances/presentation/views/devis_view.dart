import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

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
    return Padding(
      padding: const EdgeInsets.only(
        top: 75,
      ),
      child: BlurContainer(
        height: size.height * .5,
        width: size.width * .7,
        opacity: 0.6,
        blurContainerBody: const DevisBody(),
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type de carburant*',
                  style: Styles.normal14.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const MyCheckBox(),
              ],
            ),
          ],
        ),
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

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Theme.of(context).colorScheme.primary,
      )),
      child: Row(
        children: [
          RoundCheckBox(
            onTap: (selected) {
              setState(() {
                value = !value;
              });
            },
            isChecked: value,
            size: 25,
            checkedColor: Theme.of(context).colorScheme.primary,
            checkedWidget: const SizedBox(),
            animationDuration: const Duration(
              milliseconds: 150,
            ),
          ),
        ],
      ),
    );
  }
}
