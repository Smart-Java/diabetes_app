import 'package:equatable/equatable.dart';

class PractitionerSchedulePageState extends Equatable {
  const PractitionerSchedulePageState({
    this.isLoading,
    this.isPraAuth,
    this.patientDataList,
    this.practitonerFullname,
    this.requestMessage,
  });

  final bool? isLoading;
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
      ];

  PractitionerSchedulePageState copyWith({
    bool? isLoading,
    bool? isUserAuth,
    List? patientDataList,
    String? practitonerFullname,
    String? requestMessage,
  }) {
    return PractitionerSchedulePageState(
      isLoading: isLoading,
      isPraAuth: isUserAuth,
      patientDataList: patientDataList,
      practitonerFullname: practitonerFullname,
      requestMessage: requestMessage,
    );
  }
}
