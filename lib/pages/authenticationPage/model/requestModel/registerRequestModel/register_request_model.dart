import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends Equatable {
  const RegisterRequestModel(
      {required this.emailAddress, required this.password, required this.firstName, required this.lastName, required this.retypePassword});

  final String emailAddress;
  final String password;
  final String retypePassword;
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [emailAddress, password];

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(this);
  }
}
