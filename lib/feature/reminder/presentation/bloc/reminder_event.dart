part of 'reminder_bloc.dart';

@immutable
sealed class ReminderEvent {}

class UploadMedicineEvent extends ReminderEvent {
  final String name;
  final String time;

  UploadMedicineEvent({required this.name, required this.time});
}

class WatchMedicinesEvent extends ReminderEvent {}

class RemoveMedicineEvent extends ReminderEvent {
  final String name;
  RemoveMedicineEvent({required this.name});
}
