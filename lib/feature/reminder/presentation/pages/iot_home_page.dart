import 'package:flutter/material.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';
import 'package:iot_app/feature/reminder/presentation/pages/medicine_reminder_page.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/medicine_card.dart';
import 'package:iot_app/init_dependencies.dart';

class IotHomePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const IotHomePage());

  const IotHomePage({super.key});

  @override
  State<IotHomePage> createState() => _IotHomePageState();
}

class _IotHomePageState extends State<IotHomePage> {
  late final MedicineRepository repository;

  @override
  void initState() {
    super.initState();
    repository = serviceLocator<MedicineRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Medicine"),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to settings page
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: StreamBuilder<List<Medicine>>(
        stream: repository.watchMedicines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final medicines = snapshot.data ?? [];
          if (medicines.isEmpty) {
            return const Center(
              child: Text("No medicines found. Please add some."),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return MedicineCard(medicine: medicine);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MedicineReminderPage.route());
        },
        tooltip: 'Add medicine or Prescription',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Prescription",
          ),
        ],
      ),
    );
  }
}
