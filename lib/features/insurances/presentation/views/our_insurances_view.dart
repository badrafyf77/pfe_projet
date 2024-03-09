import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/our_insurances_body.dart';

class OurInsurancesView extends StatelessWidget {
  const OurInsurancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Nos Assurances",
      ),
      body: OurInsurancesBody(),
    );
  }
}