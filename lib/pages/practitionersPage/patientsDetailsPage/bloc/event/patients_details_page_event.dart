import 'package:equatable/equatable.dart';

abstract class PatientsDetailsPageEvent extends Equatable {
  const PatientsDetailsPageEvent();
}


// ignore: must_be_immutable
class GetPractitionerFullnameDetailsPageEvent extends PatientsDetailsPageEvent {
  const GetPractitionerFullnameDetailsPageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class GetGlucoseReadingPatientsDetailsPageEvent
    extends PatientsDetailsPageEvent {
  bool isItForUpdate;
  String patientEmail;
  GetGlucoseReadingPatientsDetailsPageEvent({
    required this.isItForUpdate,
    required this.patientEmail,
  }) : super();

  @override
  List<Object?> get props => [
        isItForUpdate,
        patientEmail,
      ];
}

// ignore: must_be_immutable
class GetLastTwoWeeksReadingPatientsDetailsPageEvent
    extends PatientsDetailsPageEvent {
  bool isItForUpdate;
  String patientEmail;
  GetLastTwoWeeksReadingPatientsDetailsPageEvent({
    required this.isItForUpdate,
    required this.patientEmail,
  }) : super();

  @override
  List<Object?> get props => [
        isItForUpdate,
        patientEmail,
      ];
}
