import 'package:equatable/equatable.dart';

class ReminderPageState extends Equatable {
  const ReminderPageState({
    this.isLoading,
    this.isAddRequestInProgress,
    this.isAddRequestSuccessful,
    this.isListReady,
    this.reminderDataList,
    this.requestMessage,
  });

  final bool? isLoading;
  final bool? isAddRequestInProgress;
  final bool? isAddRequestSuccessful;
  final bool? isListReady;
  final List? reminderDataList;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isAddRequestInProgress,
        isAddRequestSuccessful,
        isListReady,
        reminderDataList,
        requestMessage,
      ];

  ReminderPageState copyWith({
    bool? isLoading,
    bool? isAddRequestInProgress,
    bool? isAddRequestSuccessful,
    bool? isListReady,
    List? reminderDataList,
    String? requestMessage,
  }) {
    return ReminderPageState(
      isLoading: isLoading,
      isAddRequestInProgress: isAddRequestInProgress,
      isListReady: isListReady,
      reminderDataList: reminderDataList,
      requestMessage: requestMessage,
      isAddRequestSuccessful: isAddRequestSuccessful,
    );
  }
}
