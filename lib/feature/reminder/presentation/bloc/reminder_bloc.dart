import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';
import 'package:meta/meta.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final MedicineRepository repository;

  ReminderBloc(this.repository) : super(ReminderInitial()) {
    on<UploadMedicineEvent>((event, emit) async {
      // Simulate a delay for the upload process
      emit(ReminderLoading());
      final result = await repository.uploadMedicine(
        name: event.name,
        time: event.time,
        day: event.day,
      );

      result.fold((l) => emit(ReminderFailure(message: l.toString())), (r) {
        emit(ReminderUploadSuccess());
        add(WatchMedicinesEvent());
      });
    });

    on<WatchMedicinesEvent>((event, emit) async {
      emit(ReminderLoading());
      print('[Bloc] Watching medicines...');

      final stream = repository.watchMedicines();
      stream.listen(
        (medicines) {
          print('[Bloc] Got ${medicines.length} items');
        },
        onError: (e) {
          print('[Bloc] Error: $e');
        },
      );

      await emit.forEach<List<Medicine>>(
        stream,
        onData: (medicines) {
          print('[Bloc] Received ${medicines.length} medicines');
          return ReminderDisplaySuccess(medicines: medicines);
        },
        onError: (error, _) => ReminderFailure(message: error.toString()),
      );
    });

    on<RemoveMedicineEvent>((event, emit) async {
      final result = await repository.removeMedicine(name: event.name);
      result.fold((l) => emit(ReminderFailure(message: l.toString())), (r) {
        emit(ReminderRemoveSuccess());
        add(WatchMedicinesEvent());
      });
    });
  }
}
