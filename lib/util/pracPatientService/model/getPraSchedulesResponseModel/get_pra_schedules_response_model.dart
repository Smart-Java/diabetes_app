import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pra_schedules_response_model.g.dart';

@JsonSerializable()
class GetPraSchedulesResponseModel extends Equatable {
  const GetPraSchedulesResponseModel(
      {this.message, this.status = false, this.data});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory GetPraSchedulesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPraSchedulesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPraSchedulesResponseModelToJson(this);
  }
}
