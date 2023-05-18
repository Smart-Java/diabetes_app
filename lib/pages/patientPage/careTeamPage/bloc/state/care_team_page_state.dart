import 'package:equatable/equatable.dart';

class CareTeamPageState extends Equatable {
  const CareTeamPageState({
    this.isLoading,
    this.isPermissionRequestLoading,
    this.isListReady,
    this.careTeamDataList,
    this.requestMessage,
  });

  final bool? isLoading;
  final bool? isPermissionRequestLoading;
  final bool? isListReady;
  final List? careTeamDataList;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isPermissionRequestLoading,
        isListReady,
        careTeamDataList,
        requestMessage,
      ];

  CareTeamPageState copyWith({
    bool? isLoading,
    bool? isPermissionRequestLoading,
    bool? isListReady,
    List? careTeamDataList,
    String? requestMessage,
  }) {
    return CareTeamPageState(
      isLoading: isLoading,
      isPermissionRequestLoading: isPermissionRequestLoading,
      isListReady: isListReady,
      careTeamDataList: careTeamDataList,
      requestMessage: requestMessage,
    );
  }
}
