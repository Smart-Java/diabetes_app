import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_diet_response_model.g.dart';

@JsonSerializable()
class GetDietResponseModel extends Equatable {
  const GetDietResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory GetDietResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetDietResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDietResponseModelToJson(this);
  }
}
