// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/edit_button_with_desc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/select_choices_and_button.dart';

class DevisDurationBody extends StatelessWidget {
  const DevisDurationBody({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const EditButtonWithDescription(),
        SelectOffersWithButton(
          devisInfo: devisInfo,
        ),
        const Spacer(),
      ],
    );
  }
}
