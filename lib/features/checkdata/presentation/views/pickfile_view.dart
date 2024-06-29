// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/checkdata/data/model/document.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/widgets/pickfile_body.dart';

class PickFileView extends StatelessWidget {
  const PickFileView({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: "Vérifier mes données",
      ),
      body: PickFileBody(
        document: document,
      ),
    );
  }
}
