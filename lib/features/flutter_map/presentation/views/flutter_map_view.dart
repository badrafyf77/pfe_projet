import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/flutter_map/presentation/views/widgets/flutter_map_body.dart';

class FlutterMapView extends StatefulWidget {
  const FlutterMapView({super.key});

  @override
  State<FlutterMapView> createState() => _FlutterMapViewState();
}

class _FlutterMapViewState extends State<FlutterMapView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Géolocalisation",
      ),
      body: FluterMapBody(),
    );
  }
}
