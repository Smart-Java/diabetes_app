import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends Equatable {
  const LoginRequestModel(
      {required this.emailAddress, required this.password, required this.deviceName});

  final String emailAddress;
  final String password;
  final String deviceName;

  @override
  List<Object?> get props => [emailAddress, password, deviceName];

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestModelToJson(this);
  }
}
