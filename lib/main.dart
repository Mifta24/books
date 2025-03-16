import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miftah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Untuk membuat tampilan aplikasi beradaptasi dengan baik pada berbagai perangkat
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

// https://www.google.co.id/books/edition/SpiderMan/RYI0DwAAQBAJ?hl=id&gbpv=1&dq=spiderman&pg=PT3&printsec=frontcover

// Fungsi getData() untuk mengambil data dari API Google Books
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/RYI0DwAAQBAJ';
    Uri uri = Uri.https(authority, path);
    return http.get(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back from the Future'),
        ),
        body: Center(
            child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  getData().then((value) {
                    // Mengambil data dari API Google Books
                    result = value.body.toString().substring(0, 450); // Menampilkan 450 karakter pertama
                    setState(() {});
                  }).catchError((_) {
                    result = 'An error occurred';
                    setState(() {});
                  });
                });
              },
              child: const Text('Go'),
            ),
            Spacer(),
            Text(
              result,
            ),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        )));
  }
}
