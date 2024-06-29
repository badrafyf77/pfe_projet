// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_blur_container.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_duration_body.dart';

class DevisDurationView extends StatelessWidget {
  const DevisDurationView({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);
  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(
        child: DevisDurationBody(
          devisInfo: devisInfo,
        ),
      ),
    );
  }
}
