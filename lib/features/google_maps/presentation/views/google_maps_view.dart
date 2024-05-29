import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: "Géolocalisation",
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(33.275854, -7.576127),
          initialZoom: 7,
          minZoom: 4,
          maxZoom: 20,
        ),
        children: [
          openStreetMapTileLayer,
          const MarkerLayer(markers: [
            Marker(
              point: LatLng(33.275854, -7.576127),
              child: Icon(
                Icons.place,
                color: Colors.red,
                size: 40,
              ),
            ),
            Marker(
              point: LatLng(33.577538, -7.604774),
              child: Icon(
                Icons.place,
                color: Colors.red,
                size: 40,
              ),
            ),
            Marker(
              point: LatLng(33.992999, -6.830427),
              child: Icon(
                Icons.place,
                color: Colors.red,
                size: 40,
              ),
            ),
          ])
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

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
