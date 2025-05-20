part of 'reminder_bloc.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

class ReminderLoading extends ReminderState {}

class ReminderUploadSuccess extends ReminderState {}

class ReminderDisplaySuccess extends ReminderState {
  final List<Medicine> medicines;

  ReminderDisplaySuccess({required this.medicines});
}

class ReminderRemoveSuccess extends ReminderState {}

class ReminderFailure extends ReminderState {
  final String message;

  ReminderFailure({required this.message});
}
