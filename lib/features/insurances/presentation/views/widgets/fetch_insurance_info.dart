import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/itus_90to.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/itus_auto.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/itus_moto.dart';

Widget fetchInsuranceInfo(String s) {
  if (s == "Itus Auto") {
    return const ItusAuto();
  } else if (s == "Itus Moto") {
    return const ItusMoto();
  } else if (s == "Itus 90to") {
    return const Itus90to();
  }
  return const ItusAuto();
}