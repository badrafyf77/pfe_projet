import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class AutoDocumentsView extends StatelessWidget {
  const AutoDocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: Container(),
    );
  }
}