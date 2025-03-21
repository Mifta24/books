import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    final myWidget =
        myPosition == '' ? const CircularProgressIndicator() : Text(myPosition);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location Miftah'),
      ),
      body: Center(
        child: FutureBuilder(
            future: position,
            builder: (context, AsyncSnapshot<Position> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data.toString());
              } else {
                return const Text('');
              }
            }),
      ),
    );
  }

// fungsi untuk mendapatkan posisi pengguna
  // Future<Position> getPosition() async {
  //   // Menambahkan delay 3 detik
  //   await Future.delayed(const Duration(seconds: 3));
  //   await Geolocator.requestPermission();
  //   await Geolocator.isLocationServiceEnabled();

  //   Position? position = await Geolocator.getCurrentPosition();

  //   return position;
  // }

  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
