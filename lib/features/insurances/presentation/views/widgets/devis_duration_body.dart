import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/edit_button_with_desc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/select_choices_and_button.dart';

class DevisDurationBody extends StatelessWidget {
  const DevisDurationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        EditButtonWithDescription(),
        SelectOffersWithButton(),
        Spacer(),
      ],
    );
  }
}