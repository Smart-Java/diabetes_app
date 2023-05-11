import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_email_for_forgot_password_response_model.g.dart';

@JsonSerializable()
class SendEmailForForgotPasswordResponseModel extends Equatable {
  const SendEmailForForgotPasswordResponseModel(
      {this.status = false, this.data, this.message});

  final bool? status;
  final String? message;
  final List? data;

  @override
  List<Object?> get props => [status, message, data];

  factory SendEmailForForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SendEmailForForgotPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendEmailForForgotPasswordResponseModelToJson(this);
  }
}
