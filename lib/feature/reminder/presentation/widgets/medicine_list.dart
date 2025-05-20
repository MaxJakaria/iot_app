import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reminder_bloc.dart';
import 'medicine_card.dart';

class MedicineList extends StatelessWidget {
  final bool showLoading;
  final Widget? emptyState;
  final Widget? errorState;

  const MedicineList({
    super.key,
    this.showLoading = true,
    this.emptyState,
    this.errorState,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      builder: (context, state) {
        // Loading state
        if (state is ReminderLoading && showLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Display list
        if (state is ReminderDisplaySuccess) {
          if (state.medicines.isEmpty) {
            return emptyState ??
                const Center(child: Text('No medicines found.'));
          }
          return ListView.builder(
            itemCount: state.medicines.length,
            itemBuilder: (context, i) {
              final medicine = state.medicines[i];
              return MedicineCard(
                medicine: medicine,
                onDelete: () {
                  context.read<ReminderBloc>().add(
                    RemoveMedicineEvent(name: medicine.name),
                  );
                },
              );
            },
          );
        }

        // Handle success states by showing a loader or just an empty container
        if (state is ReminderUploadSuccess || state is ReminderRemoveSuccess) {
          // Option 1: show loader while stream updates
          return const Center(child: CircularProgressIndicator());
        }

        // Error or failure
        if (state is ReminderFailure) {
          return errorState ??
              Center(
                child: Text(
                  'Failed: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
        }

        // Default fallback
        return const Center(child: Text('No data or unexpected state.'));
      },
    );
  }
}
