// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurance_info_body.dart';

class UserInsuranceInfoView extends StatelessWidget {
  const UserInsuranceInfoView({super.key, required this.devisInfo});

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsuranceInfoBody(
        devisInfo: devisInfo,
      ),
    );
  }
}
