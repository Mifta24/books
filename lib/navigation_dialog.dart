import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation Dialog Screen Miftah'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showColorDialog(context);
            },
            child: Text('Change Color')),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.grey[900], // Dark theme background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            title: Text(
              'Very Important Question',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Text(
              'Please choose a color',
              style: TextStyle(color: Colors.grey[300]),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    color = Color(0xFF6B4EFF);
                    Navigator.pop(context, color);
                  },
                  child: Text('Deep Purple')),
              TextButton(
                  onPressed: () {
                    color = Color(0xFF00BFA5);
                    Navigator.pop(context, color);
                  },
                  child: Text('Teal')),
              TextButton(
                  onPressed: () {
                    color = Color(0xFFFF5252);
                    Navigator.pop(context, color);
                  },
                  child: Text('Red Accent')),
            ],
          );
        });
    setState(() {});
  }
}
