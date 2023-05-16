import 'package:equatable/equatable.dart';

abstract class ReminderPageEvent extends Equatable {
  const ReminderPageEvent();
}

// ignore: must_be_immutable
class GetAllRemindersReminderPageEvent extends ReminderPageEvent {
  const GetAllRemindersReminderPageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AddRemindersReminderPageEvent extends ReminderPageEvent {
  String title;
  String date;
  String time;
  String reminderMode;
  AddRemindersReminderPageEvent({
    required this.date,
    required this.reminderMode,
    required this.time,
    required this.title,
  }) : super();

  @override
  List<Object?> get props => [
        title,
        date,
        time,
        reminderMode,
      ];
}
