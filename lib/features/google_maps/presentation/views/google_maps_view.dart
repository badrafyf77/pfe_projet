import 'package:flutter/material.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMapsBody(),
    );
  }
}

class GoogleMapsBody extends StatelessWidget {
  const GoogleMapsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GoogleMapsWidget(),
        WindowInfo(),
      ],
    );
  }
}

class GoogleMapsWidget extends StatelessWidget {
  const GoogleMapsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WindowInfo extends StatelessWidget {
  const WindowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
