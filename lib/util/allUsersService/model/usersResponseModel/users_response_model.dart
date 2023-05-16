import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel extends Equatable {
  const UsersResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UsersResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UsersResponseModelToJson(this);
  }
}
