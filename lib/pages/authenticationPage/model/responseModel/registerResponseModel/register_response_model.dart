import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends Equatable {
  const RegisterResponseModel(
      {this.message, this.data, this.status = false,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data,];

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseModelToJson(this);
  }
}
