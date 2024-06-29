import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/auto_documents_body.dart';

class AutoDocumentsView extends StatelessWidget {
  const AutoDocumentsView({super.key, required this.devisInfo});

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppAppBar(
        withHeaderAndBackBar: false,
        title: 'Devis',
      ),
      body: AutoDocumentsBody(
        devisInfo: devisInfo,
      ),
    );
  }
}
