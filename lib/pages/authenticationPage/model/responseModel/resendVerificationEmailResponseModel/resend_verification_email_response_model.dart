import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_verification_email_response_model.g.dart';

@JsonSerializable()
class ResendVerificationEmailResponseModel extends Equatable {
  const ResendVerificationEmailResponseModel(
      {this.message, this.data, this.status = false,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data,];

  factory ResendVerificationEmailResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ResendVerificationEmailResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResendVerificationEmailResponseModelToJson(this);
  }
}
