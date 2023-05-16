import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();
}

// ignore: must_be_immutable
class GetProfileDetailsProfilePageEvent extends ProfilePageEvent {
  const GetProfileDetailsProfilePageEvent() : super();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class RequestNewAccessCodeProfilePageEvent extends ProfilePageEvent {
  const RequestNewAccessCodeProfilePageEvent() : super();

  @override
  List<Object?> get props => [];
}

