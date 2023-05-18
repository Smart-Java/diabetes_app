import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_schedule_response_model.g.dart';

@JsonSerializable()
class AddScheduleResponseModel extends Equatable {
  const AddScheduleResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory AddScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddScheduleResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddScheduleResponseModelToJson(this);
  }
}
