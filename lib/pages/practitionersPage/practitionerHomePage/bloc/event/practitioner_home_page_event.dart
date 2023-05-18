import 'package:equatable/equatable.dart';

abstract class PractitionerHomePageEvent extends Equatable {
  const PractitionerHomePageEvent();
}

// ignore: must_be_immutable
class GetUserFullnameHomePageEvent extends PractitionerHomePageEvent {
  const GetUserFullnameHomePageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class GetPraPatientsHomePageEvent extends PractitionerHomePageEvent {
  bool isItForUpdate;
  GetPraPatientsHomePageEvent({
    required this.isItForUpdate,
  }) : super();

  @override
  List<Object?> get props => [
        isItForUpdate,
      ];
}


// ignore: must_be_immutable
class AddScheduleHomePageEvent extends PractitionerHomePageEvent {
  String patientEmail;
  String patientName;
  String scheduleTime;
  String scheduleDate;
  AddScheduleHomePageEvent({
    required this.patientEmail,
    required this.patientName,
    required this.scheduleDate,
    required this.scheduleTime,
  }) : super();

  @override
  List<Object?> get props => [
        patientEmail,
        scheduleTime,
        scheduleDate,
      ];
}
