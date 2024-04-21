import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_duration_body.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_blur_container.dart';

class DevisDurationView extends StatelessWidget {
  const DevisDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(child: DevisDurationBody()),
    );
  }
}