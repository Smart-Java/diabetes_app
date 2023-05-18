import 'package:equatable/equatable.dart';

class PractitionerDietPageState extends Equatable {
  const PractitionerDietPageState({
    this.isLoading,
    this.requestMessage,
    this.isRequestSuccessful,
  });

  final bool? isLoading;
  final bool? isRequestSuccessful;
  final String? requestMessage;

  @override
  List<Object?> get props => [
        isLoading,
        requestMessage,
        isRequestSuccessful,
      ];

  PractitionerDietPageState copyWith({
    bool? isLoading,
    bool? isRequestSuccessful,
    String? requestMessage,
  }) {
    return PractitionerDietPageState(
      isLoading: isLoading,
      isRequestSuccessful: isRequestSuccessful,
      requestMessage: requestMessage,
    );
  }
}
