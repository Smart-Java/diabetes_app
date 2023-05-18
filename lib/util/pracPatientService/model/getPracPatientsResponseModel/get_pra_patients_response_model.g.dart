// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pra_patients_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPraPatientsResponseModel _$GetPraPatientsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetPraPatientsResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$GetPraPatientsResponseModelToJson(
        GetPraPatientsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
