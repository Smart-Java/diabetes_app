import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fullname_response_model.g.dart';

@JsonSerializable()
class FullnameResponseModel extends Equatable {
  const FullnameResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory FullnameResponseModel.fromJson(Map<String, dynamic> json) {
    return _$FullnameResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FullnameResponseModelToJson(this);
  }
}
