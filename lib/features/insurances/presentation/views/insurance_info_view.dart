// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class InsurancesInfoView extends StatelessWidget {
  final String? insuranceType;
  const InsurancesInfoView({
    Key? key,
    required this.insuranceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: insuranceType!,
      ),
    );
  }
}
