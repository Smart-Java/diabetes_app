import 'package:equatable/equatable.dart';

class CareTeamPageState extends Equatable {
  const CareTeamPageState({
    this.isLoading,
    this.isListReady,
    this.careTeamDataList,
    this.requestMessage,
  });

  final bool? isLoading;
  final bool? isListReady;
  final List? careTeamDataList;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isListReady,
        careTeamDataList,
        requestMessage,
      ];

  CareTeamPageState copyWith({
    bool? isLoading,
    bool? isListReady,
    List? careTeamDataList,
    String? requestMessage,
  }) {
    return CareTeamPageState(
      isLoading: isLoading,
      isListReady: isListReady,
      careTeamDataList: careTeamDataList,
      requestMessage: requestMessage,
    );
  }
}
