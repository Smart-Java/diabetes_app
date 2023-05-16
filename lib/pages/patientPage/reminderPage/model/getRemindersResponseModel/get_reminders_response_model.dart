import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_reminders_response_model.g.dart';

@JsonSerializable()
class GetReminderResponseModel extends Equatable {
  const GetReminderResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory GetReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetReminderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetReminderResponseModelToJson(this);
  }
}
