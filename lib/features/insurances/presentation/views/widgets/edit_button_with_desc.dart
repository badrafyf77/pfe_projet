// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_duration_desc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/edit_button_with_text.dart';

class EditButtonWithGaranties extends StatelessWidget {
  const EditButtonWithGaranties({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EditButtonWithText(
          devisInfo: devisInfo,
        ),
        const SizedBox(
          height: 25,
        ),
        DurationViewGarantiesList(
          devisInfo: devisInfo,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
