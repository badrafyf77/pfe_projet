import 'package:flutter/material.dart';
import 'package:pfe_projet/features/flutter_map/presentation/views/widgets/flutter_map_widget.dart';

class FluterMapBody extends StatelessWidget {
  const FluterMapBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FlutterMapWidget(),
      ],
    );
  }
}
