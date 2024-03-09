import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/insurance_info_body.dart';

class InsurancesInfoView extends StatelessWidget {
  final String insuranceType;
  const InsurancesInfoView({
    Key? key,
    required this.insuranceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: insuranceType,
      ),
      body: InsuranceInfoBody(
        insuranceType: insuranceType,
      ),
    );
  }
}
