import 'package:flutter/material.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key});

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
