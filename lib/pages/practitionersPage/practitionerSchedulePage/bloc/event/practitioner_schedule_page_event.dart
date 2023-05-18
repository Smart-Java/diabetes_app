import 'package:equatable/equatable.dart';

abstract class PractitionerSchedulePageEvent extends Equatable {
  const PractitionerSchedulePageEvent();
}

// ignore: must_be_immutable
class GetPraPatientsSchedulePageEvent extends PractitionerSchedulePageEvent {
  bool isItForUpdate;
  GetPraPatientsSchedulePageEvent({
    required this.isItForUpdate,
  }) : super();

  @override
  List<Object?> get props => [
        isItForUpdate,
      ];
}

