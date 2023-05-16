import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_diet_response_model.g.dart';

@JsonSerializable()
class AddDietResponseModel extends Equatable {
  const AddDietResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory AddDietResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddDietResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDietResponseModelToJson(this);
  }
}
