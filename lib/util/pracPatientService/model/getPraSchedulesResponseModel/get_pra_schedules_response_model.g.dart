// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pra_schedules_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPraSchedulesResponseModel _$GetPraSchedulesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetPraSchedulesResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetPraSchedulesResponseModelToJson(
        GetPraSchedulesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
