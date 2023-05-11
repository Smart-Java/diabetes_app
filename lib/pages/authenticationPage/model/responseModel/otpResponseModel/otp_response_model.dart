import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response_model.g.dart';

@JsonSerializable()
class OTPResponseModel extends Equatable {
  const OTPResponseModel(
      {this.message, this.data, this.status = false,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data,];

  factory OTPResponseModel.fromJson(Map<String, dynamic> json) {
    return _$OTPResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OTPResponseModelToJson(this);
  }
}
