import 'package:equatable/equatable.dart';

class PatientsDetailsPageState extends Equatable {
  const PatientsDetailsPageState({
    this.isLoading,
    this.isLastTwoWeeksRequestInProgress,
    this.lastTwoWeeksAvgGlucoseLevel,
    this.lastTwoWeeksHighGlucoseLevel,
    this.lastTwoWeeksLowGlucoseLevel,
    this.requestMessage,
    this.readingsDataList,
    this.isReadingRequestInProgress,
    this.partitionerName,
  });

  final bool? isLoading;
  final bool? isReadingRequestInProgress;
  final bool? isLastTwoWeeksRequestInProgress;
  final String? requestMessage;
  final String? partitionerName;
  final List? readingsDataList;
  final double? lastTwoWeeksAvgGlucoseLevel;
  final double? lastTwoWeeksLowGlucoseLevel;
  final double? lastTwoWeeksHighGlucoseLevel;

  @override
  List<Object?> get props => [
        isLoading,
        lastTwoWeeksAvgGlucoseLevel,
        lastTwoWeeksHighGlucoseLevel,
        lastTwoWeeksLowGlucoseLevel,
        isLastTwoWeeksRequestInProgress,
        requestMessage,
        readingsDataList,
        partitionerName,
      ];

  PatientsDetailsPageState copyWith({
    bool? isLoading,
    bool? isReadingRequestInProgress,
    bool? isLastTwoWeeksRequestInProgress,
    String? requestMessage,
    String? partitionerName,
    double? lastTwoWeeksAvgGlucoseLevel,
    double? lastTwoWeeksLowGlucoseLevel,
    double? lastTwoWeeksHighGlucoseLevel,
    List? readingsDataList,
  }) {
    return PatientsDetailsPageState(
      isLoading: isLoading,
      lastTwoWeeksAvgGlucoseLevel: lastTwoWeeksAvgGlucoseLevel,
      lastTwoWeeksHighGlucoseLevel: lastTwoWeeksHighGlucoseLevel,
      lastTwoWeeksLowGlucoseLevel: lastTwoWeeksLowGlucoseLevel,
      isLastTwoWeeksRequestInProgress: isLastTwoWeeksRequestInProgress,
      requestMessage: requestMessage,
      readingsDataList: readingsDataList,
      isReadingRequestInProgress: isReadingRequestInProgress,
      partitionerName: partitionerName,
    );
  }
}
