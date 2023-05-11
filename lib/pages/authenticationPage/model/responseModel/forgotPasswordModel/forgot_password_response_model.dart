import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel extends Equatable {
  const ForgotPasswordResponseModel(
      {this.status = false, this.data, this.message});

  final bool? status;
  final String? message;
  final List? data;

  @override
  List<Object?> get props => [status, message, data];

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgotPasswordResponseModelToJson(this);
  }
}
