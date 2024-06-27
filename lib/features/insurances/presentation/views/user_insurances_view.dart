import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class UserInsurancesView extends StatelessWidget {
  const UserInsurancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsurancesBody(),
    );
  }
}

class UserInsurancesBody extends StatelessWidget {
  const UserInsurancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}