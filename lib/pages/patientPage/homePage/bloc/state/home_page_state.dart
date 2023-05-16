import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  const HomePageState({
    this.isLoading,
    this.isUserAuth,
    this.isLastReadingRequestInProgress,
    this.isLastTwoWeeksRequestInProgress,
    this.lastGlucoseRating,
    this.lastGlucoseLevel,
    this.lastTwoWeeksAvgGlucoseLevel,
    this.lastTwoWeeksHighGlucoseLevel,
    this.lastTwoWeeksLowGlucoseLevel,
    this.userFullname,
    this.requestMessage,
    this.readingsDataList,
    this.lastGlucoseTime,
    this.isAddRequestInProgress,
    this.isAddRequestSuccessful,
  });

  final bool? isLoading;
  final bool? isUserAuth;
  final bool? isAddRequestInProgress;
  final bool? isAddRequestSuccessful;
  final bool? isLastReadingRequestInProgress;
  final bool? isLastTwoWeeksRequestInProgress;
  final String? requestMessage;
  final String? userFullname;
  final String? lastGlucoseLevel;
  final String? lastGlucoseRating;
  final String? lastGlucoseTime;
  final List? readingsDataList;
  final double? lastTwoWeeksAvgGlucoseLevel;
  final double? lastTwoWeeksLowGlucoseLevel;
  final double? lastTwoWeeksHighGlucoseLevel;

  @override
  List<Object?> get props => [
        isLoading,
        userFullname,
        lastGlucoseLevel,
        lastGlucoseRating,
        lastGlucoseTime,
        lastTwoWeeksAvgGlucoseLevel,
        lastTwoWeeksHighGlucoseLevel,
        lastTwoWeeksLowGlucoseLevel,
        isUserAuth,
        isLastReadingRequestInProgress,
        isLastTwoWeeksRequestInProgress,
        requestMessage,
        readingsDataList,
        isAddRequestInProgress,
        isAddRequestSuccessful,
      ];

  HomePageState copyWith({
    bool? isLoading,
    bool? isAddRequestInProgress,
    bool? isAddRequestSuccessful,
    bool? isUserAuth,
    bool? isLastReadingRequestInProgress,
    bool? isLastTwoWeeksRequestInProgress,
    String? requestMessage,
    String? lastGlucoseTime,
    String? userFullname,
    String? lastGlucoseLevel,
    String? lastGlucoseRating,
    double? lastTwoWeeksAvgGlucoseLevel,
    double? lastTwoWeeksLowGlucoseLevel,
    double? lastTwoWeeksHighGlucoseLevel,
    List? readingsDataList,
  }) {
    return HomePageState(
      isLoading: isLoading,
      lastGlucoseRating: lastGlucoseRating,
      lastGlucoseLevel: lastGlucoseLevel,
      lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseLevel,
      lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseLevel,
      lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseLevel,
      userFullname: userFullname,
      isLastReadingRequestInProgress: isLastReadingRequestInProgress,
      isLastTwoWeeksRequestInProgress: isLastTwoWeeksRequestInProgress,
      isUserAuth: isUserAuth,
      requestMessage: requestMessage,
      readingsDataList: readingsDataList,
      lastGlucoseTime: lastGlucoseTime,
      isAddRequestInProgress: isAddRequestInProgress,
      isAddRequestSuccessful: isAddRequestSuccessful,
    );
  }
}
