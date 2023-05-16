import 'package:equatable/equatable.dart';

abstract class CareTeamPageEvent extends Equatable {
  const CareTeamPageEvent();
}

// ignore: must_be_immutable
class GetAllCareTeamsCareTeamPageEvent extends CareTeamPageEvent {
  const GetAllCareTeamsCareTeamPageEvent() : super();

  @override
  List<Object?> get props => [];
}
