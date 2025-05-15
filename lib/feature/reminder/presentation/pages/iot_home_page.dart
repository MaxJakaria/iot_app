import 'package:flutter/material.dart';
import 'package:iot_app/feature/reminder/presentation/pages/medicine_reminder_page.dart';

class IotHomePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const IotHomePage());

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
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MedicineReminderPage.route());
          },
          child: const Text('Medicine Shedule'),
        ),
      ),
    );
  }
}
