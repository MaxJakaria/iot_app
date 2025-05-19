import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_app/core/common/snackbar.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';
import 'package:iot_app/feature/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:iot_app/feature/reminder/presentation/pages/medicine_reminder_page.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/medicine_card.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/medicine_list.dart';
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
    return BlocListener<ReminderBloc, ReminderState>(
      listener: (context, state) {
        if (state is ReminderFailure) {
          snackBar(
            context,
            'Operation failed: ${state.message}',
            isError: true,
          );
        }
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MedicineList(),
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
      ),
    );
  }
}
