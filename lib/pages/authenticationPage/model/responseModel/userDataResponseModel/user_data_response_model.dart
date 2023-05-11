import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_response_model.g.dart';

@JsonSerializable()
class UserDataResponseModel extends Equatable {
  const UserDataResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, data, status];

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserDataResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataResponseModelToJson(this);
  }
}
