import 'package:equatable/equatable.dart';

abstract class RecordPageEvent extends Equatable {
  const RecordPageEvent();
}

// ignore: must_be_immutable
class GetAllRecordsRecordPageEvent extends RecordPageEvent {
  const GetAllRecordsRecordPageEvent() : super();

  @override
  List<Object?> get props => [];
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
