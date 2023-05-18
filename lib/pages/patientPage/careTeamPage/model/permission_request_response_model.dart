import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission_request_response_model.g.dart';

@JsonSerializable()
class PermissionRequestResponseModel extends Equatable {
  const PermissionRequestResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory PermissionRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PermissionRequestResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PermissionRequestResponseModelToJson(this);
  }
}
