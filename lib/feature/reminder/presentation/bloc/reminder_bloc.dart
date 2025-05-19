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
      );

      result.fold(
        (l) => emit(ReminderFailure(message: l.toString())),
        (r) => emit(ReminderSuccess(medicine: r)),
      );
    });

    on<WatchMedicinesEvent>((event, emit) async {
      emit.forEach<List<Medicine>>(
        repository.watchMedicines(),
        onData: (medicines) => MedicinesLoaded(medicines),
        onError: (error, _) => ReminderFailure(message: error.toString()),
      );
    });
  }
}
