import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/garanties_list_and_button.dart';

class GarantiesBody extends StatelessWidget {
  const GarantiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: BlurContainer(
        height: size.height * .65,
        width: size.width * .85,
        blurContainerBody: const GarantiesListAndButton(),
      ),
    );
  }
}