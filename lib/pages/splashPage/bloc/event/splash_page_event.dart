import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class SplashPageEvent extends Equatable {
  const SplashPageEvent();
}

// ignore: must_be_immutable
class LoadOnBoardingPageEvent extends SplashPageEvent {
  
  const LoadOnBoardingPageEvent()
      : super();

  @override
  List<Object?> get props => [];
}

class AutomateUserLoginPageEvent extends SplashPageEvent {
  
  const AutomateUserLoginPageEvent()
      : super();

  @override
  List<Object?> get props => [];
}

class CheckUserLoginStatusEvent extends SplashPageEvent {
  
  const CheckUserLoginStatusEvent()
      : super();

  @override
  List<Object?> get props => [];
}
