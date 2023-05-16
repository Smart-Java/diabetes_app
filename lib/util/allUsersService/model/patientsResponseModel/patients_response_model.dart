import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patients_response_model.g.dart';

@JsonSerializable()
class PatientsResponseModel extends Equatable {
  const PatientsResponseModel(
      {this.message, this.status = false, this.data,});

  final bool? status;
  final String? message;
  final Map? data;

  @override
  List<Object?> get props => [message, status, data];

  factory PatientsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PatientsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PatientsResponseModelToJson(this);
  }
}
