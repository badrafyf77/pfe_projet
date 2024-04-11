import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          MyTextField(
            isPassField: false,
            controller: controller,
            hintText: "Puissance fiscale",
            validator: (validator) {
              return "s";
            },
          ),
        ],
      ),
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
    return RoundCheckBox(
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
    );
  }
}
