import 'package:equatable/equatable.dart';

class RecordPageState extends Equatable {
  const RecordPageState({
    this.isLoading,
    this.isUpdateRequestInProgress,
    this.isUpdateRequestSuccessful,
    this.isListReady,
    this.recordDataList,
    this.requestMessage,
  });

  final bool? isLoading;
  final bool? isUpdateRequestInProgress;
  final bool? isUpdateRequestSuccessful;
  final bool? isListReady;
  final Map? recordDataList;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isUpdateRequestInProgress,
        isUpdateRequestSuccessful,
        isListReady,
        recordDataList,
        requestMessage,
      ];

  RecordPageState copyWith({
    bool? isLoading,
    bool? isUpdateRequestInProgress,
    bool? isUpdateRequestSuccessful,
    bool? isListReady,
    Map? recordDataList,
    String? requestMessage,
  }) {
    return RecordPageState(
      isLoading: isLoading,
      isUpdateRequestInProgress: isUpdateRequestInProgress,
      isListReady: isListReady,
      recordDataList: recordDataList,
      requestMessage: requestMessage,
      isUpdateRequestSuccessful: isUpdateRequestSuccessful,
    );
  }
}
