import 'package:equatable/equatable.dart';

class PractitionerHomePageState extends Equatable {
  const PractitionerHomePageState({
    this.isLoading,
    this.isPraAuth,
    this.patientDataList,
    this.practitonerFullname,
    this.requestMessage,
    this.isScheduleRequestInProgress,
    this.isScheduleRequestSuccessful,
  });

  final bool? isLoading;
  final bool? isScheduleRequestInProgress;
  final bool? isScheduleRequestSuccessful;
  final bool? isPraAuth;
  final List? patientDataList;
  final String? practitonerFullname;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isPraAuth,
        patientDataList,
        practitonerFullname,
        requestMessage,
        isScheduleRequestInProgress,
        isScheduleRequestSuccessful,
      ];

  PractitionerHomePageState copyWith({
    bool? isLoading,
    bool? isUserAuth,
    bool? isScheduleRequestInProgress,
    bool? isScheduleRequestSuccessful,
    List? patientDataList,
    String? practitonerFullname,
    String? requestMessage,
  }) {
    return PractitionerHomePageState(
      isLoading: isLoading,
      isPraAuth: isUserAuth,
      patientDataList: patientDataList,
      practitonerFullname: practitonerFullname,
      requestMessage: requestMessage,
      isScheduleRequestInProgress: isScheduleRequestInProgress,
      isScheduleRequestSuccessful: isScheduleRequestSuccessful,
    );
  }
}
