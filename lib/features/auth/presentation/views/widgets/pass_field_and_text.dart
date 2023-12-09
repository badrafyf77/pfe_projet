import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_field.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class PassFields extends StatelessWidget {
  const PassFields({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Mot de passe',
            style: Styles.normal16,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        SizedBox(
            height: 44,
            child: MyTextField(
              isPassField: true,
              controller: controller,
              prefixIcon: Icons.lock,
              hintText: '++++++++',
            )),
      ],
    );
  }
}
