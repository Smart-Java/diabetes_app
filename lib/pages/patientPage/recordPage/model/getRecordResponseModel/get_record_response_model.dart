import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_record_response_model.g.dart';

@JsonSerializable()
class GetRecordResponseModel extends Equatable {
  const GetRecordResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory GetRecordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetRecordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetRecordResponseModelToJson(this);
  }
}
