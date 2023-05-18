import 'package:equatable/equatable.dart';

abstract class CareTeamPageEvent extends Equatable {
  const CareTeamPageEvent();
}

// ignore: must_be_immutable
class GetAllCareTeamsCareTeamPageEvent extends CareTeamPageEvent {
  bool isItForUpdate;
  GetAllCareTeamsCareTeamPageEvent({
    required this.isItForUpdate,
  }) : super();

  @override
  List<Object?> get props => [isItForUpdate];
}

// ignore: must_be_immutable
class GiveDoctorPermissionCareTeamPageEvent extends CareTeamPageEvent {
  String doctorEmail;
  GiveDoctorPermissionCareTeamPageEvent({
    required this.doctorEmail,
  }) : super();

  @override
  List<Object?> get props => [doctorEmail];
}
