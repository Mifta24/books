import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Miftah'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                color = Color(0xFF6B4EFF);
                Navigator.pop(context, color);
              },
              child: const Text('Change to Deep Purple'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Color(0xFF00BFA5);
                Navigator.pop(context, color);
              },
              child: const Text('Change to Teal'),
            ),
            ElevatedButton(
              onPressed: () {
                color = Color(0xFFFF5252);
                Navigator.pop(context, color);
              },
              child: const Text('Change to Red Accent'),
            ),
          ],
        ),
        
      ),
    );
  }
}
