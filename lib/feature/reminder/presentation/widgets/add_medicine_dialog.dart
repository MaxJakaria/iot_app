import 'package:flutter/material.dart';

class AddMedicineDialog extends StatefulWidget {
  final void Function(String name, String time, String day) onAdd;

  const AddMedicineDialog({super.key, required this.onAdd});

  @override
  State<AddMedicineDialog> createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {
  final nameController = TextEditingController();
  final timeController = TextEditingController();
  final dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Medicine Reminder'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Medicine Name'),
          ),
          TextField(
            controller: timeController,
            decoration: const InputDecoration(
              labelText: 'Number of Times to take',
            ),
          ),
          TextField(
            controller: dayController,
            decoration: const InputDecoration(labelText: 'Days to take'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameController.text.isNotEmpty &&
                timeController.text.isNotEmpty &&
                dayController.text.isNotEmpty) {
              widget.onAdd(
                nameController.text,
                timeController.text,
                dayController.text,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
