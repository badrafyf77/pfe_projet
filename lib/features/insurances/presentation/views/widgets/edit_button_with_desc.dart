import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_duration_desc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/edit_button_with_text.dart';

class EditButtonWithDescription extends StatelessWidget {
  const EditButtonWithDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditButtonWithText(),
          SizedBox(
            height: 25,
          ),
          DescriptionsText(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}