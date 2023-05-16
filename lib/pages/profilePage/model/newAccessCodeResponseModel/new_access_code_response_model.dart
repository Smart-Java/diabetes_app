import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_access_code_response_model.g.dart';

@JsonSerializable()
class NewAccessCodeResponseModel extends Equatable {
  const NewAccessCodeResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory NewAccessCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NewAccessCodeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewAccessCodeResponseModelToJson(this);
  }
}
