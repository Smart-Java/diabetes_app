import 'package:equatable/equatable.dart';

abstract class PractitionerDietPageEvent extends Equatable {
  const PractitionerDietPageEvent();
}

// ignore: must_be_immutable
class AddNewDietDietPageEvent extends PractitionerDietPageEvent {
  String dietTitle;
  String dietDetails;
  String dietDate;
  String patientAccessCode;
  AddNewDietDietPageEvent(
      {required this.dietTitle,
      required this.dietDetails,
      required this.dietDate,
      required this.patientAccessCode})
      : super();

  @override
  List<Object?> get props =>
      [dietTitle, dietDetails, dietDate, patientAccessCode];
}
