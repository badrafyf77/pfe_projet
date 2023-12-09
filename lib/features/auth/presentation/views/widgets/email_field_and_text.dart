import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_field.dart';
import 'package:pfe_projet/core/utils/styles.dart';

class EmailFields extends StatelessWidget {
  const EmailFields({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Email',
            style: Styles.normal16,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        SizedBox(
            height: 44,
            child: MyTextField(
              isPassField: false,
              controller: controller,
              prefixIcon: Icons.mail,
              hintText: 'exemple@gmail.com',
            )),
      ],
    );
  }
}
