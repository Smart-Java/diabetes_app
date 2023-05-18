import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_pra_patients_response_model.g.dart';

@JsonSerializable()
class GetPraPatientsResponseModel extends Equatable {
  const GetPraPatientsResponseModel(
      {this.message, this.status = false, this.data});

  final bool? status;
  final String? message;
  final List? data;

  @override
  List<Object?> get props => [message, status, data];

  factory GetPraPatientsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPraPatientsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPraPatientsResponseModelToJson(this);
  }
}
