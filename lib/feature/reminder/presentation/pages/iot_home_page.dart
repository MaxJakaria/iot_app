import 'package:flutter/material.dart';

class IotHomePage extends StatefulWidget {
  const IotHomePage({super.key});

  @override
  State<IotHomePage> createState() => _IotHomePageState();
}

class _IotHomePageState extends State<IotHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to settings page
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to IoT Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
