// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/garanties_list_and_button.dart';

class GarantiesBody extends StatelessWidget {
  const GarantiesBody({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: BlurContainer(
        height: size.height * .65,
        width: size.width * .85,
        blurContainerBody: GarantiesListAndButton(
          devisInfo: devisInfo,
        ),
      ),
    );
  }
}
