import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_blur_container.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_info_body.dart';

class DevisInfoView extends StatelessWidget {
  const DevisInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(child: DevisInfoBody()),
    );
  }
}
