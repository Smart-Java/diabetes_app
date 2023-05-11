import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request_model.g.dart';

@JsonSerializable()
class ForgotPasswordRequestModel extends Equatable {
  const ForgotPasswordRequestModel(
      {required this.emailAddress, required this.confirmPassword, required this.password, required this.token});

  final String emailAddress;
  final String password;
  final String confirmPassword;
  final String token;

  @override
  List<Object?> get props => [emailAddress, password, confirmPassword, password,];

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgotPasswordRequestModelToJson(this);
  }
}
