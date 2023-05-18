import 'package:equatable/equatable.dart';

abstract class DietPageEvent extends Equatable {
  const DietPageEvent();
}

// ignore: must_be_immutable
class GetAllDietDietPageEvent extends DietPageEvent {
  bool isItForUpdate;
  GetAllDietDietPageEvent({required this.isItForUpdate}) : super();

  @override
  List<Object?> get props => [isItForUpdate];
}

// ignore: must_be_immutable
class RequestForDietDietPageEvent extends DietPageEvent {
  const RequestForDietDietPageEvent() : super();

  @override
  List<Object?> get props => [];
}
