import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reading_response_model.g.dart';

@JsonSerializable()
class ReadingResponseModel extends Equatable {
  const ReadingResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory ReadingResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ReadingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ReadingResponseModelToJson(this);
  }
}
