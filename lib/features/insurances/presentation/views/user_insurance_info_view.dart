import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class UserInsuranceInfoView extends StatelessWidget {
  const UserInsuranceInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsuranceInfoBody(),
    );
  }
}

class UserInsuranceInfoBody extends StatelessWidget {
  const UserInsuranceInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}