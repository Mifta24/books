import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    // memanggil fungsi getPosition() untuk mendapatkan posisi pengguna
    getPosition().then((Position myPos) {
      // menampilkan posisi pengguna dalam bentuk string
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
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
        child: myWidget,
      ),
    );
  }

// fungsi untuk mendapatkan posisi pengguna
  Future<Position> getPosition() async {
    // Menambahkan delay 3 detik
    await Future.delayed(const Duration(seconds: 3));
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();

    Position? position = await Geolocator.getCurrentPosition();

    return position;
  }
}
