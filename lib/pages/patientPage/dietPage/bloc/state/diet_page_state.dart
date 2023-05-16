import 'package:equatable/equatable.dart';

class DietPageState extends Equatable {
  const DietPageState({
    this.isLoading,
    this.isDietRequestInProgress,
    this.isDietRequestSuccessful,
    this.isListReady,
    this.dietDataList,
    this.requestMessage,
  });

  final bool? isLoading;
  final bool? isDietRequestInProgress;
  final bool? isDietRequestSuccessful;
  final bool? isListReady;
  final List? dietDataList;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isDietRequestInProgress,
        isDietRequestSuccessful,
        isListReady,
        dietDataList,
        requestMessage,
      ];

  DietPageState copyWith({
    bool? isLoading,
    bool? isDietRequestInProgress,
    bool? isDietRequestSuccessful,
    bool? isListReady,
    List? dietDataList,
    String? requestMessage,
  }) {
    return DietPageState(
      isLoading: isLoading,
      isDietRequestInProgress: isDietRequestInProgress,
      isListReady: isListReady,
      dietDataList: dietDataList,
      requestMessage: requestMessage,
      isDietRequestSuccessful: isDietRequestSuccessful,
    );
  }
}
