import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../widgets/location_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? latitude;
  double? longitude;
  String status = "Tekan tombol untuk dapatkan lokasi";

  void getLocation() async {
    setState(() {
      status = "Mencari lokasi...";
    });

    try {
      final pos = await LocationService().getCurrentLocation();
      setState(() {
        latitude = pos.latitude;
        longitude = pos.longitude;
        status = "Lokasi ditemukan";
      });
    } catch (e) {
      setState(() {
        status = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi GPS Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocationDisplay(latitude: latitude, longitude: longitude),
            const SizedBox(height: 20),
            Text(status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getLocation,
              child: const Text("Ambil Lokasi Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
