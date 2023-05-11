import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_email_verification_request_model.g.dart';

@JsonSerializable()
class PasswordEmailVerificationRequestModel extends Equatable {
  const PasswordEmailVerificationRequestModel(
      {required this.emailAddress,});

  final String emailAddress;

  @override
  List<Object?> get props => [emailAddress,];

  factory PasswordEmailVerificationRequestModel.fromJson(Map<String, dynamic> json) {
    return _$PasswordEmailVerificationRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PasswordEmailVerificationRequestModelToJson(this);
  }
}
