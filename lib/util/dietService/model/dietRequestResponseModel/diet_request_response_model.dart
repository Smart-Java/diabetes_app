import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diet_request_response_model.g.dart';

@JsonSerializable()
class DietRequestResponseModel extends Equatable {
  const DietRequestResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory DietRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DietRequestResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DietRequestResponseModelToJson(this);
  }
}
