import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_app/core/API/iot_api.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';
import 'package:iot_app/feature/reminder/presentation/bloc/reminder_bloc.dart';
import 'package:iot_app/feature/reminder/presentation/widgets/add_medicine_dialog.dart';
import 'package:iot_app/init_dependencies.dart';
import '../../domain/entities/medicine.dart';
import '../widgets/medicine_card.dart';

class MedicineReminderPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MedicineReminderPage());

  const MedicineReminderPage({super.key});

  @override
  State<MedicineReminderPage> createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  late final MedicineRepository repository;

  @override
  void initState() {
    super.initState();
    repository = serviceLocator<MedicineRepository>();
  }

  void _showAddMedicineDialog() async {
    await showDialog(
      context: context,
      builder:
          (context) => AddMedicineDialog(
            onAdd: (name, time) async {
              setState(() {
                repository.addMedicine(Medicine(name: name, time: time));
              });

              // Push to Firestore: 'medicines' collection, doc ID = medicine name
              // final firestore = FirebaseFirestore.instance;
              // await firestore.collection('medicines').doc(name).set({
              //   'name': name,
              //   'time': time.toString(), // Format as needed
              // });

              // Upload to Firestore
              context.read<ReminderBloc>().add(
                UploadMedicineEvent(name: name, time: time),
              );

              // Send to ESP32
              final success = await IotApi.sendReminder(name, time);
              if (!success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Failed to send reminder to IoT device. Please check your connection.',
                    ),
                  ),
                );
              }
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicines = repository.getMedicines();

    return BlocListener<ReminderBloc, ReminderState>(
      listener: (context, state) {
        if (state is ReminderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reminder uploaded to Firestore!')),
          );
        } else if (state is ReminderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Upload failed: ${state.message}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Medicine Reminders')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: medicines.length,
                  itemBuilder: (context, index) {
                    final medicine = medicines[index];
                    return MedicineCard(
                      medicine: medicine,
                      onDelete: () {
                        setState(() {
                          repository.removeMedicine(medicine);
                        });
                      },
                    );
                  },
                ),
              ),
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
        ),
      ),
    );
  }
}
