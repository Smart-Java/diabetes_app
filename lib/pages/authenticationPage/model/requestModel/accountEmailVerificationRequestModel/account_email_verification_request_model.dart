import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_email_verification_request_model.g.dart';

@JsonSerializable()
class AccountEmailVerificationRequestModel extends Equatable {
  const AccountEmailVerificationRequestModel(
      {required this.emailAddress,});

  final String emailAddress;

  @override
  List<Object?> get props => [emailAddress,];

  factory AccountEmailVerificationRequestModel.fromJson(Map<String, dynamic> json) {
    return _$AccountEmailVerificationRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountEmailVerificationRequestModelToJson(this);
  }
}
