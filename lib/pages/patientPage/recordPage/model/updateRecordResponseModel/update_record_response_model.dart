import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_record_response_model.g.dart';

@JsonSerializable()
class UpdateRecordResponseModel extends Equatable {
  const UpdateRecordResponseModel(
      {this.message, this.status = false,});

  final bool? status;
  final String? message;

  @override
  List<Object?> get props => [message, status,];

  factory UpdateRecordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateRecordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateRecordResponseModelToJson(this);
  }
}
