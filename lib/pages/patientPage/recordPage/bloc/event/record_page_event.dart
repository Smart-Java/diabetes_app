import 'package:equatable/equatable.dart';

abstract class RecordPageEvent extends Equatable {
  const RecordPageEvent();
}

// ignore: must_be_immutable
class GetAllRecordsRecordPageEvent extends RecordPageEvent {
  bool isItForUpdate;
  String? praPatientEmail;
  GetAllRecordsRecordPageEvent({
    required this.isItForUpdate,
    this.praPatientEmail,
  }) : super();

  @override
  List<Object?> get props => [isItForUpdate, praPatientEmail];
}

// ignore: must_be_immutable
class UpdateRecordRecordPageEvent extends RecordPageEvent {
  String cholesterolLevel;
  String medications;
  String weight;
  String height;
  String physicalActivities;
  String insulinUsage;
  UpdateRecordRecordPageEvent({
    required this.cholesterolLevel,
    required this.height,
    required this.insulinUsage,
    required this.medications,
    required this.physicalActivities,
    required this.weight,
  }) : super();

  @override
  List<Object?> get props => [
        cholesterolLevel,
        height,
        insulinUsage,
        medications,
        physicalActivities,
        weight,
      ];
}
