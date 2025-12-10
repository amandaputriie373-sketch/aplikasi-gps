import 'package:flutter/material.dart';

class LocationDisplay extends StatelessWidget {
  final double? latitude;
  final double? longitude;

  const LocationDisplay({super.key, this.latitude, this.longitude});

  @override
  Widget build(BuildContext context) {
    if (latitude == null || longitude == null) {
      return const Text("Lokasi belum tersedia");
    }
    return Column(
      children: [
        Text("Latitude: $latitude"),
        Text("Longitude: $longitude"),
      ],
    );
  }
}
