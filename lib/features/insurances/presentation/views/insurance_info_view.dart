import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class InsurancesInfoView extends StatelessWidget {
  const InsurancesInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Itus Auto",
      ),
    );
  }
}
