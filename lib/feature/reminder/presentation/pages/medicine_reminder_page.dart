import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_app/core/API/iot_api.dart';
import 'package:iot_app/core/common/snackbar.dart';
import 'package:iot_app/feature/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/add_medicine_dialog.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/medicine_list.dart';

class MedicineReminderPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MedicineReminderPage());

  const MedicineReminderPage({super.key});

  @override
  State<MedicineReminderPage> createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  @override
  void initState() {
    super.initState();
    // Start watching medicines via BLoC
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReminderBloc>().add(WatchMedicinesEvent());
    });
  }

  void _showAddMedicineDialog() async {
    await showDialog(
      context: context,
      builder:
          (context) => AddMedicineDialog(
            onAdd: (name, time, day) async {
              // Upload to Firestore via BLoC
              context.read<ReminderBloc>().add(
                UploadMedicineEvent(name: name, time: time, day: day),
              );

              // Send to ESP32
              final success = await IotApi.sendReminder(name, time);
              if (!success) {
                snackBar(
                  context,
                  'Failed to send reminder to IoT device. Please check your connection.',
                  isError: true,
                );
              }
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine List')),
      body: BlocConsumer<ReminderBloc, ReminderState>(
        listener: (context, state) {
          if (state is ReminderFailure) {
            snackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Expanded(child: MedicineList()),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Reminder'),
                    onPressed: _showAddMedicineDialog,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
