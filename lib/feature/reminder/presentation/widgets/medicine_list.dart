import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reminder_bloc.dart';
import 'medicine_card.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderBloc, ReminderState>(
      builder: (context, state) {
        if (state is ReminderLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MedicinesLoaded) {
          if (state.medicines.isEmpty) {
            return const Center(child: Text('No medicines found.'));
          }
          return ListView.builder(
            itemCount: state.medicines.length,
            itemBuilder:
                (context, i) => MedicineCard(
                  medicine: state.medicines[i],
                  onDelete: () {
                    context.read<ReminderBloc>().add(
                      RemoveMedicineEvent(name: state.medicines[i].name),
                    );
                  },
                ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
