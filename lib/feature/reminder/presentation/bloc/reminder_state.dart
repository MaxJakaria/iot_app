part of 'reminder_bloc.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

class ReminderUploading extends ReminderState {}

class ReminderSuccess extends ReminderState {
  final Medicine medicine;

  ReminderSuccess({required this.medicine});
}

class ReminderFailure extends ReminderState {
  final String message;

  ReminderFailure({required this.message});
}
