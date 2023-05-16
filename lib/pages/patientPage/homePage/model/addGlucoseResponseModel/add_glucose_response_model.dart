import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_glucose_response_model.g.dart';

@JsonSerializable()
class AddGlucoseResponseModel extends Equatable {
  const AddGlucoseResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory AddGlucoseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddGlucoseResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddGlucoseResponseModelToJson(this);
  }
}
