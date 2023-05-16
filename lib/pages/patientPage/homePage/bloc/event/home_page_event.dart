import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

// ignore: must_be_immutable
class GetUserFullnameHomePageEvent extends HomePageEvent {
  const GetUserFullnameHomePageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class GetLastReadingHomePageEvent extends HomePageEvent {
  const GetLastReadingHomePageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class GetLastTwoWeeksReadingHomePageEvent extends HomePageEvent {
  const GetLastTwoWeeksReadingHomePageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class AddGlucoseReadingHomePageEvent extends HomePageEvent {
  double glucoseValue;
  String time;
  String description;
  AddGlucoseReadingHomePageEvent({
    required this.glucoseValue,
    required this.time,
    required this.description,
  }) : super();

  @override
  List<Object?> get props => [
        glucoseValue,
        description,
        time,
      ];
}
