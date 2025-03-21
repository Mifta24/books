import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = const Color.fromARGB(255, 89, 108, 216);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
        elevation: 0,
        title: const Text('Navigation First Screen Miftah',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: (){},
            child: Text(
              'Change Color',
              style: TextStyle(fontSize: 16),
            )),
      ),
    );
  }
}
