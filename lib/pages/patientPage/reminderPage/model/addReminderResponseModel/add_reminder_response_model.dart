import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_reminder_response_model.g.dart';

@JsonSerializable()
class AddReminderResponseModel extends Equatable {
  const AddReminderResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory AddReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddReminderResponseModelToJson(this);
  }
}
