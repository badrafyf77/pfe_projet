import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/pickfile_body.dart';

class PickFileView extends StatelessWidget {
  const PickFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Vérifier mes données",
      ),
      body: PickFileBody(),
    );
  }
}